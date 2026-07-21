# Runtime Package Standard V1

## Purpose

Runtime Package je minimální, soběstačný provozní snapshot Executive Systemu pro další instanci jediné role `INITIO MASTER`. Jeho účelem je přenést aktuální řídicí stav bez historie chatu, bez archivů a bez kopie celého repository.

Standardní výstup je jediný soubor:

`INITIO-MASTER-RUNTIME.zip`

## Mandatory package contents

ZIP musí zachovat níže uvedené relativní cesty a smí obsahovat pouze tyto soubory:

1. `10-identity/INITIO-EXECUTIVE-DIRECTOR.md`
2. `00-governance/INITIO-MASTER-RUNTIME-LIFECYCLE.md`
3. `00-governance/EXECUTIVE-SYSTEM-RULES.md`
4. `00-governance/SOURCE-OF-TRUTH-MAP.md`
5. `00-governance/UPDATE-PROTOCOL.md`
6. `00-governance/CONTINUITY-PROTOCOL.md`
7. `20-state/MASTER-PROJECT-STATE.md`
8. `20-state/CURRENT-PRIORITIES.md`
9. `20-state/OPEN-DECISIONS.md`
10. `20-state/LOCK-REGISTER.md`
11. `20-state/RISK-REGISTER.md`
12. `40-continuity/CURRENT-HANDOFF.md`
13. `40-continuity/NEW-RUNTIME-START.md`

Prvních jedenáct požadovaných typů obsahu je tímto pokryto. `INITIO-MASTER-RUNTIME-LIFECYCLE.md` a `EXECUTIVE-SYSTEM-RULES.md` jsou navíc povinné, protože na ně odkazuje startovací sekvence a bez nich by balíček nebyl soběstačný.

## Content rules

- Obsah se kopíruje z aktuálního pracovního stromu `INITIO-Executive` až po dokončení Executive Sync, Reality Review a validačního checklistu.
- Soubor v balíčku musí být byte-for-byte kopií svého aktuálního zdroje; při exportu se nepřepisuje ani neupravuje.
- Relativní adresářová struktura se zachovává, aby všechny odkazy v `NEW-RUNTIME-START.md` fungovaly po rozbalení.
- ZIP nesmí obsahovat nadřazenou exportní složku; v jeho kořeni musí být pouze adresáře `00-governance/`, `10-identity/`, `20-state/` a `40-continuity/` s přesným allowlistem výše.
- Balíček nesmí obsahovat chat transcript, historický export, archiv, auditní snapshot, `.git`, source repository, implementaci, dočasný soubor ani jiný neuvedený artefakt.
- Runtime Package není nový Source of Truth ani nový Executive System. Je to přenosný snapshot autoritativního Executive Systemu v okamžiku exportu.

## Acceptance criteria

Runtime Package je platný pouze tehdy, když:

- obsahuje všech 13 povinných souborů a žádný další soubor;
- `CURRENT-PRIORITIES.md` a `CURRENT-HANDOFF.md` uvádějí stejnou jedinou Current Priority a stejný směr pokračování;
- `CURRENT-HANDOFF.md` obsahuje Current State, Completed Work, Locked Decisions, Open Decisions, Risks a jednu vykonatelnou Exact Next Action;
- `NEW-RUNTIME-START.md` lze použít jako jediný vstup do prázdné instance a všechny soubory, které přikazuje načíst, jsou v ZIPu;
- nová instance může určit aktuální stav, hranice autority, platné LOCKy, otevřená rozhodnutí, rizika a další akci bez historie chatu;
- ZIP projde kontrolou integrity a přesného allowlistu podle `EXPORT-PROCEDURE.md`.

Jakákoliv chybějící položka, soubor navíc, nevyřešený rozpor v Executive State nebo závislost na historii chatu znamená `FAIL`; balíček se nesmí předat dalšímu runtime.
