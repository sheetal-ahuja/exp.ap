import 'package:expenses_tracker/bar.dart';
import 'package:expenses_tracker/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:expenses_tracker/screens/add_expense/blocs/create_expense_bloc/create_expense_bloc.dart';
import 'package:expenses_tracker/screens/add_expense/blocs/create_categorybloc/create_category_bloc.dart';
import 'package:expenses_tracker/screens/add_expense/blocs/get_categories_bloc/get_categories_bloc.dart';
import 'package:expenses_tracker/screens/add_expense/views/add_expense.dart';
import 'package:expenses_tracker/screens/home/blocs/get_expenses_bloc/get_expenses_bloc.dart';
import 'package:expenses_tracker/screens/home/views/main_screen.dart';
import 'package:expenses_tracker/screens/stats/stats.dart';
import 'package:expense_repository/expense_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  late Color selectedItem = Colors.blue;
  Color unselectedItem = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetExpensesBloc, GetExpensesState>(
      builder: (context, state) {
        if (state is GetExpensesSuccess) {
          return Scaffold(
            bottomNavigationBar: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(30)),
              child: BottomNavigationBar(
                onTap: (value) {
                  setState(() {
                    index = value;
                  });
                },
                showSelectedLabels: false,
                showUnselectedLabels: false,
                elevation: 3,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(
                      CupertinoIcons.home,
                      color: index == 0 ? selectedItem : unselectedItem,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      CupertinoIcons.graph_square_fill,
                      color: index == 1 ? selectedItem : unselectedItem,
                    ),
                    label: 'Stats',
                  ),
                ],
              ),
            ),
            body: Stack(
              children: [
                index == 0 ? MainScreen(state.expenses) :  BarChartSample2(),
              ],
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Padding(
              padding: const EdgeInsets.only(
                  right: 48.0), // Adjust padding as needed
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    onPressed: () async {
                      Expense? newExpense = await Navigator.push(
                        context,
                        MaterialPageRoute<Expense>(
                          builder: (BuildContext context) => MultiBlocProvider(
                            providers: [
                              BlocProvider(
                                create: (context) =>
                                    CreateCategoryBloc(FirebaseExpenseRepo()),
                              ),
                              BlocProvider(
                                create: (context) =>
                                    GetCategoriesBloc(FirebaseExpenseRepo())
                                      ..add(GetCategories()),
                              ),
                              BlocProvider(
                                create: (context) =>
                                    CreateExpenseBloc(FirebaseExpenseRepo()),
                              ),
                            ],
                            child: const AddExpense(),
                          ),
                        ),
                      );

                      if (newExpense != null) {
                        setState(() {
                          state.expenses.insert(0, newExpense);
                        });
                      }
                    },
                    shape: const CircleBorder(),
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0XFF7C7BFF),
                      ),
                      child: const Icon(CupertinoIcons.add),
                    ),
                  ),
                  SizedBox(
                      width: 20), // Adjust spacing between buttons as needed
                  FloatingActionButton(
                    onPressed: () {
                      // Define the action for the second button her
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const HomePage();
                      }));
                    },
                    shape: const CircleBorder(),
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0XFF7C7BFF),
                      ),
                      child: const Icon(CupertinoIcons.chat_bubble),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
