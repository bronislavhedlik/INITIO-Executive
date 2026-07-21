# Source of Truth Map

## Product State Authority

`20-state/EXECUTIVE-DECISION-REGISTER.md` je jediný autoritativní zdroj oficiálního produktového stavu a produktových priorit. INITIO MASTER používá bez výjimky toto pořadí:

1. Executive Decision Register
2. Reality Review
3. Repository Reality
4. Historical Records

Repository určuje implementační realitu. Reality Review ji ověřuje a klasifikuje. Ani jeden z těchto zdrojů nesmí automaticky vytvořit nebo změnit oficiální produktový stav; ten vzniká pouze explicitním Executive Decision v registru.

| Projekt | Autorita pro | Aktuální omezení / status |
| --- | --- | --- |
| `BH_OS` | Produktový záměr, Product Brain V3, Operating Mind, Director 2, živé Product Cases a LOCK register | Není software repository. Product Bible je výše, ale samostatný kanonický exemplář zde není zjevně vystaven. LOCK register je neúplný. |
| `bh-os-clean` | Aktuální software, schema, testy a implementační evidence BH OS | Repository je rozsáhle dirty; audit 2026-07-21 nespustil runtime, live providery ani deployment. Starší PASS není aktuální runtime certifikace. |
| `INITIO` | Zamýšlený firemní knowledge repository a jeho dokumentační governance | Zatím pouze kandidát na SoT: žádný dokument není doloženě Approved a neexistuje commit. Obsah je převážně scaffold. |
| `initio-brand` | Brand governance a schválený master primárního symbolu v1.0.0 | Jediný doložený brandový asset LOCK je symbol a production notes. Brand Constitution a většina systému chybí. |
| `INITIO-Constitution` | Constitution governance, INDEX a konsolidovaná Product Strategy Constitution | Product Strategy je Complete a závazná; formální LOCK, verze, datum a changelog nejsou doloženy. Ostatních 10 jednotek chybí. |
| `Chaty 1` | Historie rozhodnutí, pracovní modely, role, preference a kontinuita | Historické tvrzení samo nepřebíjí současnou repository realitu. |
| `Chaty 2` | Evidence Library exportovaných příloh | Bez transcriptů; metadata sama nedokládají finální rozhodnutí ani LOCK. |
| `INITIO-Executive` | Executive Decision Register, centrální stav, cross-project navigace, priority, registry a handoff | Executive Decision Register je autoritativní pro oficiální produktový stav; ostatní části jsou podpůrná continuity a evidence vrstva. |

## Authority by question

- Oficiální produktový stav a produktová priorita: výhradně `20-state/EXECUTIVE-DECISION-REGISTER.md`.
- Implementace: `bh-os-clean` + aktuální runtime evidence.
- Produktový záměr: Product Bible; produktové doporučení: Product Brain V3; platné Executive Decision a jeho status: výhradně Executive Decision Register.
- Firemní identita/provoz: pouze schválené artefakty v `INITIO`; aktuálně převážně `Unknown`.
- Brand asset: verzovaný approved master a jeho production notes v `initio-brand`.
- Product Strategy principy: konsolidovaná Product Strategy Constitution.
- Historický důvod nebo pracovní preference: chatové inventury, vždy označeno jako historické/pracovní.
