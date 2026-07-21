# Runtime Package Standard V1

## Purpose

Runtime Package je minimální, soběstačný provozní snapshot Executive Systemu pro další instanci jediné role `INITIO MASTER`. Jeho účelem je přenést aktuální řídicí stav bez historie chatu, bez archivů a bez kopie celého repository.

Standardní výstup je jediný soubor v lokálním adresáři `runtime/`:

`runtime/INITIO-MASTER-RUNTIME.zip`

## Mandatory package contents

ZIP musí zachovat relativní cesty a smí obsahovat pouze těchto 24 souborů:

1. `START-HERE.md`
2. `README.md`
3. `00-governance/EXECUTIVE-SYSTEM-RULES.md`
4. `00-governance/SOURCE-OF-TRUTH-MAP.md`
5. `00-governance/UPDATE-PROTOCOL.md`
6. `00-governance/CONTINUITY-PROTOCOL.md`
7. `00-governance/INITIO-MASTER-RUNTIME-LIFECYCLE.md`
8. `10-identity/INITIO-EXECUTIVE-DIRECTOR.md`
9. `20-state/MASTER-PROJECT-STATE.md`
10. `20-state/CURRENT-PRIORITIES.md`
11. `20-state/OPEN-DECISIONS.md`
12. `20-state/LOCK-REGISTER.md`
13. `20-state/RISK-REGISTER.md`
14. `30-knowledge/PROJECT-MAP.md`
15. `30-knowledge/EXECUTIVE-KNOWLEDGE.md`
16. `30-knowledge/DECISION-HISTORY.md`
17. `30-knowledge/WORKING-STANDARDS.md`
18. `30-knowledge/USER-WORKING-PREFERENCES.md`
19. `40-continuity/CURRENT-HANDOFF.md`
20. `40-continuity/NEW-RUNTIME-START.md`
21. `50-evidence/EVIDENCE-INDEX.md`
22. `60-runtime/RUNTIME-PACKAGE-STANDARD.md`
23. `60-runtime/RUNTIME-PACKAGE-CHECKLIST.md`
24. `60-runtime/EXPORT-PROCEDURE.md`

Tento seznam a allowlist v `scripts/export-runtime.sh` musí zůstat shodné.

## Content rules

- Obsah se kopíruje z aktuálního pracovního stromu `INITIO-Executive` až po dokončení Executive Sync, Reality Review a validačního checklistu.
- Každý zdrojový soubor v balíčku musí být byte-for-byte kopií svého aktuálního zdroje; při exportu se nepřepisuje ani neupravuje. `START-HERE.md` generuje exporter.
- Relativní adresářová struktura se zachovává, aby všechny odkazy v `NEW-RUNTIME-START.md` fungovaly po rozbalení.
- ZIP nesmí obsahovat nadřazenou exportní složku; `START-HERE.md`, `README.md` a povolené číslované adresáře jsou přímo v jeho kořeni.
- Balíček nesmí obsahovat chat transcript, historický export, archiv, auditní snapshot, `.git`, source repository, implementaci, dočasný soubor ani jiný neuvedený artefakt.
- Runtime Package není nový Source of Truth ani nový Executive System. Je to přenosný snapshot autoritativního Executive Systemu v okamžiku exportu.

## Acceptance criteria

Runtime Package je platný pouze tehdy, když:

- obsahuje všech 24 povinných souborů a žádný další soubor;
- `CURRENT-PRIORITIES.md` a `CURRENT-HANDOFF.md` uvádějí stejnou jedinou Current Priority a stejný směr pokračování;
- `CURRENT-HANDOFF.md` obsahuje Current State, Completed Work, Locked Decisions, Open Decisions, Risks a jednu vykonatelnou Exact Next Action;
- `NEW-RUNTIME-START.md` lze použít jako jediný vstup do prázdné instance a všechny soubory, které přikazuje načíst, jsou v ZIPu;
- nová instance může určit aktuální stav, hranice autority, platné LOCKy, otevřená rozhodnutí, rizika a další akci bez historie chatu;
- ZIP projde kontrolou integrity a přesného allowlistu podle `EXPORT-PROCEDURE.md`.

Jakákoliv chybějící položka, soubor navíc, nevyřešený rozpor v Executive State nebo závislost na historii chatu znamená `FAIL`; balíček se nesmí předat dalšímu runtime.
