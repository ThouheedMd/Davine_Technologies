# Pipeline Failure: Troubleshooting Report

## 1. Failure

A controlled error was introduced by changing the expected value in a unit test:

```diff
- assert.strictEqual(add(2, 3), 5);
+ assert.strictEqual(add(2, 3), 6);
```

The change was committed and pushed. The GitHub webhook started the pipeline automatically.

| Stage | Result |
|-------|--------|
| Checkout | Passed |
| Build | Passed |
| **Test** | **Failed** |
| Validation | Skipped (earlier stage failed) |

## 2. Troubleshooting

1. Opened the failed build and clicked **Console Output** (Stage View showed the red Test stage).
2. Scrolled to the Test stage output and found the failing assertion:

```text
[Pipeline] { (Test)
+ npm test
not ok 1 - add() adds two numbers
  failureType: 'testCodeFailure'
  expected: 6
  actual: 5
# tests 4
# pass 3
# fail 1
ERROR: script returned exit code 1
Finished: FAILURE
```

3. Compared `expected` and `actual`: `add(2, 3)` returns 5, so the **test** was wrong, not the application code.
4. Confirmed locally: `npm test` reproduced the same failure.

## 3. Root Cause

The expected value in `test/app.test.js` was incorrect (6 instead of 5).

## 4. Resolution

```bash
sed -i 's/add(2, 3), 6/add(2, 3), 5/' test/app.test.js
npm test                       # 4 passed locally
git commit -am "fix: correct expected value in add() test"
git push
```

The webhook triggered a new build and all four stages passed (Checkout, Build, Test, Validation).

## 5. Lessons Learned

- Read the Console Output and find the **first** failing stage before changing anything.
- Reproduce the failure locally before pushing a fix.
- A good pipeline fails safely: later stages (Validation) did not run on broken code.
- Do not just re-run a failed build; find the root cause first.