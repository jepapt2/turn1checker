import 'package:flutter/material.dart';

sealed class Test {
  final String name;
  Test(this.name);
}

class TestA extends Test {
  final int age;
  TestA(String name, this.age) : super(name);
}

class TestB extends Test {
  final String height;
  TestB(String name, this.height) : super(name);
}

final a = TestA('a', 1);

final List<Test> tests = [
  TestA('a', 1),
  TestB('b', '1'),
];

Widget whoIsPerson(Test test) => switch (test) {
      TestA() => Text('(a)'),
      TestB() => Text('a'),
    };
