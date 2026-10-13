// Uses Node's built-in test runner (no external dependencies).
const test = require('node:test');
const assert = require('node:assert');
const { add, greet, isEven } = require('../app');

test('add() adds two numbers', () => {
  assert.strictEqual(add(2, 3), 5);
});

test('greet() returns a greeting with the name', () => {
  assert.strictEqual(greet('Jenkins'), 'Hello, Jenkins!');
});

test('greet() has a default greeting', () => {
  assert.strictEqual(greet(), 'Hello, DevOps!');
});

test('isEven() detects even and odd numbers', () => {
  assert.strictEqual(isEven(4), true);
  assert.strictEqual(isEven(7), false);
});