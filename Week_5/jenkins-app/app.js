// Small sample application used to practise CI/CD with Jenkins.

function add(a, b) {
  return a + b;
}

function greet(name) {
  if (!name) return 'Hello, DevOps!';
  return `Hello, ${name}!`;
}

function isEven(n) {
  return n % 2 === 0;
}

module.exports = { add, greet, isEven };

if (require.main === module) {
  console.log(greet('Jenkins'));
}