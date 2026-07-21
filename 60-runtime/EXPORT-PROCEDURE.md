# Runtime Package Export Procedure V1

## Required workflow

Každý export probíhá v tomto pořadí:

`INITIO MASTER` → `Executive Sync` → `Reality Review` → `Update Executive` → `Validate` → `Create Runtime Package` → `Create ZIP` → `Next Runtime`

## Procedure

### 1. INITIO MASTER

INITIO MASTER zahájí export jako pokračování jediné hlavní role. Export nevytváří novou roli, autoritu ani paralelní stav.

### 2. Executive Sync

Načti aktuální identity, governance, state, registry a continuity soubory. Porovnej Current Priority, Exact Next Action a handoff s poslední významnou událostí.

### 3. Reality Review

Ověř fakta relevantní pro aktuální stav a další akci proti příslušnému Source of Truth. Historický audit, starý PASS ani chat nepoužívej jako automatickou současnou realitu. Rozpor označ jako `Conflict`; nevyplňuj jej odhadem.

### 4. Update Executive

Spusť `00-governance/UPDATE-PROTOCOL.md`. Aktualizuj pouze dotčené Executive soubory a zajisti, že state, priority, registry a handoff popisují stejnou ověřenou realitu.

### 5. Validate

Vyplň celý `60-runtime/RUNTIME-PACKAGE-CHECKLIST.md`. Pokračuj pouze při úplném `PASS`.

### 6. Create Runtime Package

Z kořene `INITIO-Executive` spusť jediný podporovaný exportní příkaz:

```sh
bash scripts/export-runtime.sh
```

Exporter ověří existenci každého vstupu, vytvoří dočasný staging mimo repository, zkopíruje přesný allowlist a vygeneruje `START-HERE.md`. Při chybě vypíše chybějící cestu a skončí nenulovým exit kódem.

### 7. Create ZIP

Exporter vytvoří a ověří kandidátní ZIP v dočasném prostoru. Existující cílový ZIP nahradí až po úspěšné kontrole integrity a přesného manifestu. Výsledek ověř:

```sh
unzip -t runtime/INITIO-MASTER-RUNTIME.zip
unzip -Z1 runtime/INITIO-MASTER-RUNTIME.zip
```

Výstup se musí jmenovat přesně `runtime/INITIO-MASTER-RUNTIME.zip`. Musí obsahovat právě 24 povinných souborů. Dočasné soubory exporter uklidí automaticky při úspěchu i chybě.

### 8. Next Runtime

Předej pouze `INITIO-MASTER-RUNTIME.zip`. Po nahrání ZIPu a zprávě `Jsi INITIO MASTER. Pokračuj.` nová instance začne v `START-HERE.md`, načte `40-continuity/NEW-RUNTIME-START.md` a pokračuje podle aktuálního handoffu. Předchozí chat, celé repository ani historické exporty nejsou vstupem.

Pokud nová instance nedokáže pouze z balíčku přesně uvést Current Priority, Exact Next Action, Current State, Completed Work, Locked Decisions, Open Decisions a Risks, export je neplatný a vrací se do kroku Reality Review.
