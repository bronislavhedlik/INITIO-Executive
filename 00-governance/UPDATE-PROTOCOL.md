# Update Protocol

1. Jako první načti `20-state/EXECUTIVE-DECISION-REGISTER.md` a zjisti platné Executive Decisions.
2. Potom načti Reality Review, následně Repository Reality a nakonec Historical Records. Toto pořadí nikdy neobracej.
3. Urči doménu tvrzení a příslušný podpůrný Source of Truth.
4. U implementace ověř repository/runtime reality, ale neodvozuj z ní oficiální produktový stav ani prioritu.
5. Zapiš klasifikaci, datum ověření, zdroj a případný konflikt. Konflikt řeš podle pořadí autorit, nikoli přepsáním Executive Decision.
6. Nový oficiální produktový stav nebo prioritu zapiš nejprve jako explicitní rozhodnutí do `EXECUTIVE-DECISION-REGISTER.md` se všemi povinnými poli a povoleným statusem.
7. Poté aktualizuj v tomto pořadí: `MASTER-PROJECT-STATE`, příslušný podpůrný registr, `CURRENT-PRIORITIES`, `DECISION-HISTORY`, `EVIDENCE-INDEX`, `CURRENT-HANDOFF`.
8. LOCK přidej jen s doloženou autoritou, scope, rozhodnutím, důvodem/evidencí a reopening condition; jinak jej označ jako historický, neúplný nebo nedoložený.
9. Recommendation nikdy nepřepiš jako oficiální produktový stav bez explicitního Executive Decision.
10. Po změně proveď cross-document kontrolu statusu, priority, další akce a odkazů vůči Executive Decision Register.

## Mandatory triggers

Protokol spusť minimálně při dokončení fáze, Product Owner PASS, LOCKu nebo jeho řízené změně, změně priority, zásadním rozhodnutí, konfliktu dokumentace s realitou, změně stavu projektu, vzniku/uzavření rizika a předání do dalšího runtime.

Aktualizuj pouze dotčené dokumenty a vytvoř commit až pro významný ucelený stav. Běžná diskuse, pracovní poznámka a drobný krok samy o sobě commit nevyžadují. Tím se chrání aktuálnost systému bez nekonečné dokumentační administrativy.

Před určením nové priority vždy ověř skutečný stav relevantního projektu, ale prioritu stanov pouze explicitním Executive Decision v registru. Historickou inventuru, historický PASS ani existenci implementace nepoužívej jako oficiální produktový stav nebo prioritu.

Zdrojové projekty zůstávají read-only. Executive dokumenty nesmějí obsahovat citlivá data.
