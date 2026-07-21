# Risk Register

| Riziko | Evidence class | Dopad | Kontrola |
| --- | --- | --- | --- |
| Záměna historického LOCKu za současnou autoritu | `Current Fact` | Chybné rozhodnutí | Ověřit proti doménovému SoT a repository reality. |
| Schváleno zaměněno za implementováno | `Historical Fact` + současná relevance | Falešný PASS | Vyžadovat aktuální repo/runtime evidence. |
| Dirty software checkout bez čerstvé baseline | `Current Fact` | Nejasný stav a regresní riziko | Nedělat stavové závěry bez autorizované validace. |
| Firemní scaffold vytváří falešný dojem completeness | `Current Fact` | Řízení bez autority | Prázdné oblasti značit Unknown/Not started. |
| Brand LOCK symbolu není v changelogu/Git/release package | `Current Fact` | Slabá auditovatelnost/distribuce | Zachovat master, později formalizovat governance. |
| Constitution systém má 1 z 11 jednotek | `Current Fact` | Neúplné authority boundaries | Neodvozovat chybějící mandáty. |
| Chaty 2 nemají transcripty | `Current Fact` | Attachment metadata může být přeceněno | Používat jako Evidence Library, ne decision authority. |
| Neúplná LOCK metadata | `Current Fact` | Nejasné reopening | Doplnit pouze v autoritativním zdroji po schválení. |
| Citlivá/klientská data v executive vrstvě | `Recommendation` | Security/privacy | Evidovat pouze bezpečná metadata, nikdy secrets ani osobní klientská data. |

