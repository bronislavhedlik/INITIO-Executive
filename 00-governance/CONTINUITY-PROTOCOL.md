# Continuity Protocol

Aktualizuj handoff po dokončeném kroku, změně priority, novém/změněném LOCKu, novém konfliktu, blokaci nebo před změnou chatu.

`CURRENT-HANDOFF.md` musí vždy obsahovat: Current Phase, Current Goal, Completed Work, Current State, Locked Decisions, Open Decisions, Current Priority, Exact Next Action, Files to Read First, Risks, Do Not Reopen a Runtime Continuation Instruction.

Exact Next Action musí být jediná vykonatelná akce s jasným výstupem. Nový runtime musí nejprve použít `NEW-RUNTIME-START.md`, načíst předepsaných pět dokumentů a pokračovat bez reinterpretace. Pokud evidence od poslední aktualizace mohla změnit stav, nejprve ji ověří.

