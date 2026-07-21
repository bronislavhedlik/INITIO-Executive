# Executive Decision Register V1

## Authority

Tento registr je jediný autoritativní zdroj oficiálního produktového stavu pro INITIO Executive System.

Repository dokládá implementaci, ale neurčuje produktový stav ani produktovou prioritu. Reality Review ověřuje aktuální realitu, ale samo nevydává Executive Decision. Historické záznamy poskytují kontext, ale nejsou aktuální autoritou.

INITIO MASTER musí při určování oficiálního produktového stavu vždy postupovat v tomto pořadí:

1. `20-state/EXECUTIVE-DECISION-REGISTER.md`
2. Reality Review
3. Repository Reality
4. Historical Records

Při konfliktu platí zdroj výše v tomto pořadí. Chybějící rozhodnutí se nesmí automaticky doplnit z implementace ani historie; musí být vedeno jako `OPEN`, dokud nevznikne explicitní Executive Decision.

## Status Values

Jediné povolené hodnoty pole `Status` jsou:

- `OPEN`
- `PARTIAL`
- `COMPLETE`
- `LOCKED`
- `SUPERSEDED`
- `REJECTED`

## Decisions

### EDR-001

- **Decision ID:** EDR-001
- **Area:** Executive Governance / Product State Authority
- **Decision:** Executive Decision Register je jediný autoritativní zdroj oficiálního produktového stavu. Repository určuje stav implementace, nikoli oficiální produktový stav nebo produktovou prioritu.
- **Status:** LOCKED
- **Evidence:** Executive directive „EXECUTIVE DECISION REGISTER V1“, vydaná 2026-07-21; tento registr a související governance aktualizace.
- **Approved By:** INITIO Executive
- **Approval Date:** 2026-07-21
- **Supersedes:** Jakékoli pravidlo nebo praxi, která odvozuje oficiální produktový stav či prioritu přímo z repository, Reality Review nebo historických záznamů.
- **Notes:** Povinné pořadí čtení je Executive Decision Register → Reality Review → Repository Reality → Historical Records.

### EDR-002

- **Decision ID:** EDR-002
- **Area:** Next Product Priority
- **Decision:** Následující hlavní produktová priorita nebyla explicitně schválena. Nesmí být odvozena z míry implementace ani z pořadí oblastí v Reality Review.
- **Status:** OPEN
- **Evidence:** `40-continuity/CURRENT-HANDOFF.md`; `50-evidence/EXECUTIVE_REALITY_SYNC.md`.
- **Approved By:** Pending explicit INITIO Executive decision
- **Approval Date:** Pending
- **Supersedes:** Žádné rozhodnutí.
- **Notes:** Uzavření vyžaduje explicitní Executive Decision zaznamenané v tomto registru.

## Record Rules

Každé nové nebo změněné rozhodnutí musí obsahovat všech devět polí: Decision ID, Area, Decision, Status, Evidence, Approved By, Approval Date, Supersedes a Notes.

Změna rozhodnutí se provádí novým záznamem. Nahrazený záznam dostane `SUPERSEDED` a nový záznam jej uvede v poli `Supersedes`. `LOCKED` rozhodnutí lze změnit pouze novým explicitně schváleným Executive Decision s dohledatelnou evidencí.
