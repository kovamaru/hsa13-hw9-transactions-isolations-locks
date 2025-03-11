# hsa13-hw9-transactions-isolations-locks

This repository contains a set of tests demonstrating transaction isolation levels and their effects on different concurrency issues in Percona (MySQL) and PostgreSQL.

### How to Run Tests
1. Start the database container using Docker.
2. Execute SQL scripts inside the database to reproduce each concurrency issue.
3. Screenshots for validation are available in the respective folders.

### Directory Structure
```
├── init
│   ├── percona-init.sql
│   ├── postgres-init.sql
├── screenshots
│   ├── percona
│   ├── postgres
├── docker-compose.yml
├── README.md
```


## Transaction Isolation Levels in Percona

| **Isolation Level**   | **Dirty Reads** | **Lost Updates** | **Non-Repeatable Reads** | **Phantom Reads** |
|-----------------------|----------------|------------------|--------------------------|------------------|
| **READ UNCOMMITTED**  | ✅ Possible    | ❌ Blocked (Lock wait timeout) | ✅ Possible  | ✅ Possible  |
| **READ COMMITTED**    | ❌ Not possible | ❌ Blocked (Lock wait timeout) | ✅ Possible  | ✅ Possible  |
| **REPEATABLE READ**   | ❌ Not possible | ❌ Blocked (Lock wait timeout) | ❌ Not possible | ✅ Possible  |
| **SERIALIZABLE**      | ❌ Not possible | ❌ Blocked (Lock wait timeout) | ❌ Not possible | ❌ Not possible  |

Screenshots of all executed tests can be found in the `screenshots/percona` folder.

---

## Transaction Isolation Levels in PostgreSQL

> **Note:** READ UNCOMMITTED is not supported in PostgreSQL [link](https://www.postgresql.org/docs/current/transaction-iso.html).

| **Isolation Level**   | **Dirty Reads** | **Lost Updates** | **Non-Repeatable Reads** | **Phantom Reads** |
|-----------------------|----------------|------------------|--------------------------|------------------|
| **READ COMMITTED**    | ❌ Not possible | ✅ Possible | ✅ Possible  | ✅ Possible  |
| **REPEATABLE READ**   | ❌ Not possible | ❌ Not possible | ❌ Not possible | ✅ Possible  |
| **SERIALIZABLE**      | ❌ Not possible | ❌ Not possible | ❌ Not possible | ❌ Not possible |

Screenshots of all executed tests can be found in the `screenshots/postgres` folder.



