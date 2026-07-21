# INITIO Executive System

Centrální Executive Knowledge a Continuity Layer pro INITIO. Systém sjednocuje navigaci mezi autoritami, aktuální stav, rozhodnutí, priority, rizika a předání; nenahrazuje zdrojová repositories.

`20-state/EXECUTIVE-DECISION-REGISTER.md` je jediný autoritativní zdroj oficiálního produktového stavu. Repository určuje implementaci, nikoli produktový stav nebo prioritu. INITIO MASTER vždy čte zdroje v pořadí Executive Decision Register → Reality Review → Repository Reality → Historical Records.

**Stav:** Phase 1 — Foundation complete, validováno 2026-07-21.

Jedinou hlavní řídicí rolí je `INITIO MASTER`. Názvy `INITIO MASTER V3`, V4, V5 a další označují pouze navazující runtime instance téže role. Definitivní provozní pravidla stanoví `00-governance/INITIO-MASTER-RUNTIME-LIFECYCLE.md`.

Začni v tomto pořadí:

1. `20-state/EXECUTIVE-DECISION-REGISTER.md`
2. `50-evidence/EXECUTIVE_REALITY_SYNC.md`
3. Relevantní Repository Reality
4. Relevantní Historical Records
5. `10-identity/INITIO-EXECUTIVE-DIRECTOR.md`
6. `00-governance/INITIO-MASTER-RUNTIME-LIFECYCLE.md`
7. `20-state/MASTER-PROJECT-STATE.md`
8. `20-state/CURRENT-PRIORITIES.md`
9. `20-state/LOCK-REGISTER.md`
10. `40-continuity/CURRENT-HANDOFF.md`

Pro nový prázdný runtime použij jako jediný copy-paste vstup celý obsah `40-continuity/NEW-RUNTIME-START.md`. Předchozí chat není potřeba.

Runtime Export je standardní součást Executive Workflow. Před předáním další instanci proveď povinnou sekvenci `INITIO MASTER → Executive Sync → Reality Review → Update Executive → Validate → Create Runtime Package → Create ZIP → Next Runtime` podle `60-runtime/EXPORT-PROCEDURE.md`. Výstupem je pouze `INITIO-MASTER-RUNTIME.zip` s přesným allowlistem v `60-runtime/RUNTIME-PACKAGE-STANDARD.md`; před exportem musí projít `60-runtime/RUNTIME-PACKAGE-CHECKLIST.md`.

Lokální Runtime Package vytvoř z kořene repository jedním příkazem:

```sh
bash scripts/export-runtime.sh
```

Výstup vznikne jako `runtime/INITIO-MASTER-RUNTIME.zip`.

Pravidla autority jsou v `00-governance/`. Každé tvrzení musí být klasifikováno jako Current Fact, Historical Fact, Locked Decision, Working Decision, Recommendation, Unknown nebo Conflict a musí být dohledatelné přes `50-evidence/EVIDENCE-INDEX.md`.
