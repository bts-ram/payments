-- This file will remove the db changes in reverse order
-- if a function or table doesn't have dependency then it will remove that fist
--  Think of it as a topological sort -> where independent nodes are removed first.

BEGIN;

DROP VIEW IF EXISTS account_balances;
DROP TABLE IF EXISTS entries;
DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS accounts;
DROP FUNCTION IF EXISTS forbid_ledger_changes();
DROP FUNCTION IF EXISTS check_transaction_balanced();
DROP TYPE IF EXISTS entry_direction;

COMMIT;