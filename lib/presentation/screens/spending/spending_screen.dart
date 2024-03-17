import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spending/core/adapter/expense_adapater.dart';
import 'package:spending/core/utils/utils.dart';
import 'package:spending/presentation/screens/spending/bloc/spending_bloc.dart';
import 'package:spending/presentation/screens/spending/bloc/spending_event.dart';
import 'package:spending/presentation/screens/spending/bloc/spending_state.dart';

class SpendingScreen extends StatefulWidget {
  const SpendingScreen({super.key});

  @override
  State<SpendingScreen> createState() => _SpendingScreenState();
}

class _SpendingScreenState extends State<SpendingScreen> {
  late final SpendingBloc _bloc;
  final _expenseTitleController = TextEditingController();
  final _expenseAmountController = TextEditingController();

  void _initial() async {
    _bloc = context.read<SpendingBloc>()..add(const SpendingStarted());

    _expenseTitleController.addListener(() {
      _bloc.add(
        SpendingSetExpenseTitle(
          value: _expenseTitleController.text,
        ),
      );
    });

    _expenseAmountController.addListener(() {
      _bloc.add(
        SpendingSetExpenseAmount(
          value: _expenseAmountController.text,
        ),
      );
    });
  }

  @override
  void initState() {
    _initial();
    super.initState();
  }

  @override
  void dispose() {
    _expenseTitleController.dispose();
    _expenseAmountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleTextStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        title: BlocBuilder<SpendingBloc, SpendingState>(
          builder: (context, state) {
            return Text(state.spending.title);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            margin: const EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Calculation',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text('Total Expense'),
                  BlocBuilder<SpendingBloc, SpendingState>(
                    builder: (context, state) {
                      final amount = ExpenseAdapter.calculateAmount(state.expenses);
                      return Text(
                        Utils.idr(amount),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Actions',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            _bloc.add(
                              SpendingShowCreateExpenseModalDialog(
                                context: context,
                                titleController: _expenseTitleController,
                                amountController: _expenseAmountController,
                              ),
                            );
                          },
                          child: const Text('Add Expanse'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          child: const Text('Add Income'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          report(
            title: 'Expenses',
            child: BlocBuilder<SpendingBloc, SpendingState>(
              builder: (context, state) {
                final expenses = state.expenses;

                if (expenses.isEmpty) {
                  return const Center(
                    child: Text('No Report'),
                  );
                }

                return ListView.separated(
                  itemBuilder: (context, index) {
                    final expense = expenses[index];
                    return ListTile(
                      leading: const CircleAvatar(
                        child: FaIcon(
                          FontAwesomeIcons.moneyBill,
                        ),
                      ),
                      dense: true,
                      title: Text(expense.title),
                      subtitle: Text(Utils.idr(expense.amount)),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox();
                  },
                  itemCount: expenses.length,
                );
              },
            ),
            viewMoreCallback: () {},
          ),
          const SizedBox(height: 16),
          report(
            title: 'Incomes',
            child: const Center(
              child: Text('No Report'),
            ),
            viewMoreCallback: () {},
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget report({
    required String title,
    required Widget child,
    required VoidCallback? viewMoreCallback,
  }) {
    return Expanded(
      child: Card(
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  TextButton(
                    onPressed: viewMoreCallback,
                    child: const Text('View More'),
                  ),
                ],
              ),
            ),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}
