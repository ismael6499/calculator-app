# 🧮 Calculator App: EVM Arithmetic & Logic Encapsulation

A robust smart contract implementation exploring arithmetic operations within the EVM, focusing on gas-efficient validation patterns and strict type safety.

## 🚀 Engineering Context

As a **Java Software Engineer**, arithmetic operations are typically abstracted away by the JVM. In **Solidity**, however, mathematical operations require rigorous attention to **Gas Consumption** and **Type Safety** (Signed vs. Unsigned integers).

This project focuses on the architectural differences in error handling: moving from Java's runtime exception model (`try/catch`) to Solidity's "Fail Early" pattern using **Modifiers**, ensuring transactions revert before consuming execution gas on invalid inputs.

## 💡 Project Overview

The **Calculator App** handles core mathematical operations (addition, subtraction, multiplication, division, and power) with enforced constraints.

### 🔍 Key Technical Features:

* **Declarative Validation (Modifiers):**
    * Implemented `checkMaxPowerNumber` and `checkNotZero` to decouple validation logic from business logic.
    * *Comparison:* This functions similarly to **Aspect-Oriented Programming (AOP)** or custom annotations in Java/Spring, allowing for cleaner code reuse and ensuring gas isn't wasted on invalid operations.

* **Type Safety (Int256 vs Uint256):**
    * Explicit handling of signed integers (`int256`) to support negative results in subtraction and division, addressing specific EVM storage slot behaviors that differ from standard Java primitives.

* **Encapsulation & Visibility:**
    * Strict separation of public entry points and internal logic (e.g., `substraction_logic`) to maintain a secure API surface, mirroring Java's `private`/`protected` encapsulation principles.

* **Observability (Events):**
    * Emission of `Addition` and `Substraction` events to enable asynchronous state tracking by off-chain indexers.

## 🛠️ Stack & Tools

* **Language:** Solidity `^0.8.24`.
* **Concepts:** Modifiers, Visibility Specifiers, Event Logging.
* **License:** LGPL-3.0-only.

---

*This project demonstrates low-level arithmetic handling and logic encapsulation on the Ethereum blockchain.*