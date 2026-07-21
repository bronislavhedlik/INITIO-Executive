# Update Protocol

1. Urči doménu tvrzení a příslušný Source of Truth.
2. Před aktualizací načti aktuální zdrojovou evidenci; u implementace vyžaduj repository/runtime reality.
3. Zapiš klasifikaci, datum ověření, zdroj a případný konflikt.
4. Aktualizuj v tomto pořadí: `MASTER-PROJECT-STATE`, příslušný registr, `CURRENT-PRIORITIES`, `DECISION-HISTORY`, `EVIDENCE-INDEX`, `CURRENT-HANDOFF`.
5. LOCK přidej jen s doloženou autoritou, scope, rozhodnutím, důvodem/evidencí a reopening condition; jinak jej označ jako historický, neúplný nebo nedoložený.
6. Recommendation nikdy nepřepiš jako Current Fact nebo Working Decision bez schválení.
7. Po změně proveď cross-document kontrolu statusu, priority, další akce a odkazů.

Zdrojové projekty zůstávají read-only. Executive dokumenty nesmějí obsahovat citlivá data.

