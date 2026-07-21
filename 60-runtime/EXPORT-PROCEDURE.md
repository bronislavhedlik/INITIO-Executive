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

V kořeni `INITIO-Executive` vytvoř nový dočasný staging adresář mimo repository a zkopíruj do něj přesný allowlist. Referenční shell postup:

```sh
RUNTIME_STAGE="$(mktemp -d)"
mkdir -p "$RUNTIME_STAGE/00-governance" "$RUNTIME_STAGE/10-identity" "$RUNTIME_STAGE/20-state" "$RUNTIME_STAGE/40-continuity"
cp 10-identity/INITIO-EXECUTIVE-DIRECTOR.md "$RUNTIME_STAGE/10-identity/"
cp 00-governance/INITIO-MASTER-RUNTIME-LIFECYCLE.md 00-governance/EXECUTIVE-SYSTEM-RULES.md 00-governance/SOURCE-OF-TRUTH-MAP.md 00-governance/UPDATE-PROTOCOL.md 00-governance/CONTINUITY-PROTOCOL.md "$RUNTIME_STAGE/00-governance/"
cp 20-state/MASTER-PROJECT-STATE.md 20-state/CURRENT-PRIORITIES.md 20-state/OPEN-DECISIONS.md 20-state/LOCK-REGISTER.md 20-state/RISK-REGISTER.md "$RUNTIME_STAGE/20-state/"
cp 40-continuity/CURRENT-HANDOFF.md 40-continuity/NEW-RUNTIME-START.md "$RUNTIME_STAGE/40-continuity/"
```

Ověř, že staging obsahuje přesně 13 běžných souborů a žádný jiný artefakt:

```sh
find "$RUNTIME_STAGE" -type f | sort
test "$(find "$RUNTIME_STAGE" -type f | wc -l | tr -d ' ')" = "13"
```

Výpis ručně porovnej s allowlistem v `RUNTIME-PACKAGE-STANDARD.md`. Při rozdílu export zastav.

### 7. Create ZIP

Odstraň pouze předchozí cílový ZIP, pokud je jeho nahrazení součástí právě schváleného exportu. Potom vytvoř archiv tak, aby v kořeni ZIPu nebyla staging složka:

```sh
(cd "$RUNTIME_STAGE" && zip -X -r /absolute/path/to/INITIO-MASTER-RUNTIME.zip 00-governance 10-identity 20-state 40-continuity)
unzip -t /absolute/path/to/INITIO-MASTER-RUNTIME.zip
unzip -Z1 /absolute/path/to/INITIO-MASTER-RUNTIME.zip
```

Výstup se musí jmenovat přesně `INITIO-MASTER-RUNTIME.zip`. `unzip -t` musí projít a `unzip -Z1` smí ukázat jen čtyři povolené adresáře a 13 povinných souborů. Po ověření lze staging adresář bezpečně odstranit.

### 8. Next Runtime

Předej pouze `INITIO-MASTER-RUNTIME.zip`. Nová instance jej rozbalí, použije celý obsah `40-continuity/NEW-RUNTIME-START.md` jako jediný startovací vstup a načte uvedené soubory z rozbaleného balíčku. Předchozí chat, celé repository ani historické exporty nejsou vstupem.

Pokud nová instance nedokáže pouze z balíčku přesně uvést Current Priority, Exact Next Action, Current State, Completed Work, Locked Decisions, Open Decisions a Risks, export je neplatný a vrací se do kroku Reality Review.
