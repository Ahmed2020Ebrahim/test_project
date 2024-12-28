import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/bloc/counter_bloc.dart';
import 'package:test_project/bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: const MaterialApp(
        home: MyHome(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Home"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().add(CounterAddedOne());
                },
                child: Text("Add one")),
            ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().add(CounterMinsOne());
                },
                child: Text("Mince one")),
            ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().add(CounterResetToZero());
                },
                child: Text("reset to zero")),
            BlocConsumer<CounterBloc, CounterState>(
              listener: (context, state) {},
              builder: (context, state) {
                return state is CounterHasValue ? Text(state.counterValue.toString()) : Text("0");
              },
            ),
          ],
        ),
      ),
    );
  }
}
