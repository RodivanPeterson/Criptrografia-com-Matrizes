var value = 0;

var states = {
  "start": 0,
  "operand1": 1,
  "operator": 2,
  "operand2": 3,
  "complete": 4
};
var state = states.start;

var previousOperand1 = 0;
var previousOperand2 = 0;
var previousOperation = null;

var operand1 = 0;
var operand2 = 0;
var operation = null;

function getValue()
{
  return value;
}

function setValue(n)
{
  value = n;
  var displayValue = value;

  if (displayValue > 99999999) {
    displayValue = displayValue.toExponential(4);
  } else if (displayValue < -99999999) {
    displayValue = displayValue.toExponential(4);
  } else if (displayValue > 0 && displayValue < 0.0000001) {
    displayValue = displayValue.toExponential(4);
  } else if (displayValue < 0 && displayValue > -0.0000001) {
    displayValue = displayValue.toExponential(3);
  }
