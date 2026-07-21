# Runtime Package Checklist V1

Checklist se provádí před každým exportem. Každý bod musí být ověřen proti aktuální Executive a podle potřeby doménové evidenci. Neověřený bod je `FAIL`, nikoli předpokládaný `PASS`.

## Executive readiness

- [ ] **Current Priority** — `CURRENT-PRIORITIES.md` obsahuje právě jednu hlavní prioritu a souhlasí s `CURRENT-HANDOFF.md`.
- [ ] **Exact Next Action** — handoff obsahuje právě jednu konkrétní, vykonatelnou další akci s očekávaným výstupem.
- [ ] **Current State** — stav je aktuální, datovaný nebo evidenčně dohledatelný a správně klasifikovaný.
- [ ] **Completed Work** — dokončená práce je oddělena od partial, blocked, unknown a planned práce a má odpovídající evidenci.
- [ ] **Locked Decisions** — všechny platné LOCKy jsou v `LOCK-REGISTER.md`, nejsou v rozporu s handoffem a nebyly neřízeně znovu otevřeny.
- [ ] **Open Decisions** — všechny neuzavřené rozhodovací body jsou v `OPEN-DECISIONS.md` a relevantní body jsou promítnuty do handoffu.
- [ ] **Risks** — aktivní rizika jsou v `RISK-REGISTER.md`; rizika relevantní pro další akci jsou v handoffu.
- [ ] **Handoff** — `CURRENT-HANDOFF.md` je soběstačný a obsahuje všechny povinné sekce Continuity Protocolu.
- [ ] **Executive State** — `MASTER-PROJECT-STATE.md`, priority, registry, Source of Truth Map a handoff jsou po Reality Review vzájemně konzistentní.

## Package validation

- [ ] Všech 13 souborů z `RUNTIME-PACKAGE-STANDARD.md` existuje a je aktuálních.
- [ ] ZIP obsahuje přesný allowlist a žádné historické exporty, archivy, celé repository ani dočasné soubory.
- [ ] Relativní cesty v ZIPu odpovídají standardu.
- [ ] `NEW-RUNTIME-START.md` odkazuje pouze na startovací soubory přítomné v balíčku.
- [ ] Testovací načtení z rozbaleného ZIPu umožňuje určit Current Priority, Exact Next Action, Current State, Completed Work, Locked Decisions, Open Decisions, Risks, Handoff a Executive State.
- [ ] K zahájení další instance není potřeba historie chatu ani jiný Executive soubor mimo balíček.
- [ ] Archiv projde `unzip -t INITIO-MASTER-RUNTIME.zip` bez chyby.

## Release decision

- [ ] Všechny body jsou `PASS`.
- [ ] Výstup se jmenuje přesně `INITIO-MASTER-RUNTIME.zip`.
- [ ] Balíček je připraven pro Next Runtime.

Pokud kterýkoliv bod selže, vrať se k Reality Review nebo Update Executive. Nevytvářej ani nepředávej neúplný Runtime Package.
