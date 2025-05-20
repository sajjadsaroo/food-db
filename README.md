# University Food Ordering System – README

A concise guide to the SQL schema, sample data and design principles behind a 3‑NF database for managing student food orders.

---

## Project Goals

* Track departments, students, teachers
* Define daily menus (meal × date × dish)
* Record student orders and their line‑items
* Keep the schema **clean, normalised and maintainable**

---

## Repository Structure

| File                | Role                                                |
| ------------------- | --------------------------------------------------- |
| `create_tables.sql` | Builds the full schema with keys & constraints      |
| `insert_data.sql`   | Seeds the database with demo rows                   |
| `drop_tables.sql`   | Removes every table in the correct dependency order |


---

## Writing the Database – Step by Step

> **Goal:** arrive at a fully‑normalised, self‑documenting schema with correct keys and constraints.

1. **Identify Entities**
   People (`student`, `teacher`), organisational unit (`department`), products (`food`), menu instance (`menu`), purchase header (`orders`) and purchase line (`order_item`).
2. **Choose Primary Keys**
   Use `SERIAL` (or `GENERATED ALWAYS AS IDENTITY`) for each table’s surrogate PK.
3. **Map Relationships**

   * One‑to‑many: `department → student`, `department → teacher`
   * Many‑to‑one: `orders → student`
   * Many‑to‑many resolved via `order_item`: `orders ↔ menu`.
4. **Normalise to 3‑NF**

   * *1‑NF*: atomic columns, no repeating groups.
   * *2‑NF*: composite keys eliminated (the unique trio in `menu` is enforced with a `UNIQUE` constraint, not as PK).
   * *3‑NF*: all non‑key attributes depend **only** on the key.
5. **Enforce Integrity**

   * `FOREIGN KEY` constraints with `ON DELETE` rules (`CASCADE` only where useful, e.g. `order_item`).
   * `CHECK` constraints for domain logic – positive prices, allowed meal names, quantity > 0.
6. **Script It**
   Place all `CREATE TABLE` commands in `create_tables.sql`; keep logical order so each FK references an already‑created table.
7. **Seed Data**
   Keep samples small and human‑readable. Demonstrate every relationship.
8. **Tear Down Safely**
   `drop_tables.sql` reverses creation order or uses `CASCADE` to dissolve remaining dependencies.

---


## Extending the Schema

* **Payments** – add a `payment` table linked to `orders`.
* **Stock Control** – track `inventory` movements on `food` items.
* **Nutrition** – separate `food_info` table for calories, allergens, images.

---

## Author & License

Created by **Sajjad Sarookhani** · MIT License · Feel free to fork & adapt.

---

## Database Diagram

![ER Diagram]()

