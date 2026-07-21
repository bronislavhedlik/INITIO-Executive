# Continuity Protocol

Kontinuita se řídí `INITIO-MASTER-RUNTIME-LIFECYCLE.md`. Existuje jedna hlavní role `INITIO MASTER`; označení V3, V4, V5 a další jsou pouze její navazující runtime instance.

Aktualizuj handoff po významném dokončeném kroku, dokončení fáze, Product Owner PASS, změně priority, novém nebo změněném LOCKu, zásadním rozhodnutí, konfliktu dokumentace s realitou, změně stavu projektu, vzniku/uzavření rizika, blokaci nebo před změnou runtime. Běžná diskuse a drobný pracovní krok aktualizaci ani commit automaticky nevyžadují.

`CURRENT-HANDOFF.md` musí vždy obsahovat: Current Phase, Current Goal, Completed Work, Current State, Locked Decisions, Open Decisions, Current Priority, Exact Next Action, Files to Read First, Risks, Do Not Reopen a Runtime Continuation Instruction.

Exact Next Action musí být jediná vykonatelná akce s jasným výstupem. Handoff musí být soběstačný a nesmí předpokládat přístup k historii předchozího chatu.

Při signálech ztráty runtime kvality INITIO MASTER přestane otevírat novou práci, dokončí bezpečný aktuální bod, synchronizuje Executive System, aktualizuje handoff a vyzve uživatele k otevření další instance. Uživatel nemusí předání technicky řídit.

Nový runtime použije jediný copy-paste vstup `NEW-RUNTIME-START.md`, načte předepsané dokumenty a pokračuje bez reinterpretace dokončených rozhodnutí. Pokud se relevantní evidence od posledního ověření mohla změnit, ověří ji před pokračováním.
