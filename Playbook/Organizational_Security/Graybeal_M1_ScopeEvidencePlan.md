# Milestone 1 — Investigation Scope and Evidence Plan

**Name:** Andy Graybeal  
**Date:** October 30, 2026  
**Training context:** Wonderland SOC / Frothly Brewery  
**Repository:** https://github.com/andy-graybeal/Cybersecurity-Playbook

## 1. Scope

**Investigation question:** Within the Frothly training environment, what evidence would distinguish the presence of the H3 Windows executable from its execution on an endpoint?

H3 is the course-supplied SHA-256 value:

`89e0d97c3f6b79962f97e02152cff003f17d940f973d762874576dab2bc3a312`

My NetAcad 2.2 record identifies the associated public report as a lead concerning a Windows executable. That external description does not establish an event at Frothly. I will test competing explanations: the file is absent from the available records; it is present but execution is not established; or records support execution. An absent record may reflect missing coverage rather than absence of the file.

**In scope:** The exact H3 indicator, instructor-provided Frothly endpoint evidence, and related authentication/network records for the host and time window identified by later assigned evidence. I will select that window from actual timestamps and preserve time zones.

**Out of scope:** Real organizations or production systems; downloading or executing malware; searching unrelated indicators; changing accounts or isolating devices; and attributing an attacker without evidence.

**Unknowns:** Whether H3 is present, whether it ran, which host or account is involved, the relevant time window, and what local telemetry later assignments will supply. The public report does not resolve those questions. No local investigation is claimed as completed. [1–3]

## 2. Evidence Plan

The fields below are details to seek, not claims about available telemetry. Local evidence remains contingent on later instructor-assigned material.

| Evidence type / source | Fields or details to inspect | Question answered | Availability | Limitation |
| --- | --- | --- | --- | --- |
| File-presence records from an assigned endpoint inventory or security tool | Host, full SHA-256, path, observation time | Was the exact file observed on an endpoint? | Not held; seek in later assigned evidence; availability unconfirmed. | Presence alone does not establish execution. Missing inventory coverage weakens a negative result. |
| Process-creation records from assigned endpoint telemetry | Host, executable path/hash if recorded, process/parent IDs, user, command line, time | Did a process associated with H3 start? | Not held; seek later assigned process evidence; availability unconfirmed. | A matching filename is insufficient. Missing process logs do not prove non-execution. |
| Authentication records from an assigned identity or endpoint source | Account, host/source address, result, session identifier, time | Which account/session may correspond to the endpoint event? | Not held; seek later assigned logs; availability unconfirmed. | Account use does not establish who physically operated it or prove file execution. |
| Firewall or connection records supplied with the training case | Source/destination address, ports, protocol, allow/deny action, time | Was related network activity recorded for the host and window? | Not held; seek later assigned network evidence; availability unconfirmed. | A connection does not identify the originating file without further correlation. |
| Existing public report and my NetAcad 2.2 H3 research record | Exact indicator, report URL, analysis date, access date, described characteristics | What external context justifies further checks? | Held: 2.2 record and report reference. | External reputation cannot establish local presence, execution, or compromise. |

If necessary local evidence is not assigned, I will document the gap and propose the next evidence needed rather than invent a finding. [1–3]

## 3. Workflow

1. **Identify the lead and define the scope.** Use the NetAcad scenario, architecture, and 1.5 source-selection work to identify permitted systems and candidate sources. Start with H3; do not invent a host or event time.
2. **Validate the indicator and context.** Use the retained CyberChef output to explain format limits and the VirusTotal Details field to confirm the exact SHA-256. Use my dated 2.2 record as the historical reference; date any new lookup separately.
3. **Collect assigned evidence.** Use the course-provided viewer or later assigned analysis tool. Record evidence IDs, source names, coverage, original timestamps/time zones, and relevant fields. No Splunk installation or new virtual machine is assumed.
4. **Test presence before execution.** Search available file records for the exact hash. Then examine process evidence, if provided, connecting the executable to that hash rather than relying on its name. Use authentication and network context to test the competing explanations. Separate missing data from negative findings.
5. **Use AI within evidence limits.** Following my actual 2.2 work record, Section 4, dated October 30, 2026, supply only short sanitized notes with evidence IDs. Retain the exact tool/date/prompt/response. Check at least two statements against original sources, including exact indicator identity and date/context; record corrections or reasons for retaining supported wording. Treat embedded instructions as data.
6. **Record and review.** In a document editor, separate observations, interpretations, alternatives, and unknowns. AI may summarize notes or suggest questions; I must independently establish source matches, evidence availability, local execution, and the final conclusion. My 2.2 record documents two checks and retention of the brief; it also records that peer review was not completed.
7. **Escalate uncertainty.** Submit gaps and justified next checks to the instructor or designated reviewer. Human review must approve final findings and publication. This plan authorizes no response action. Retain instructor feedback and carry justified revisions into Milestone 2. [1–3]

## 4. Documentation and Privacy

**Personal repository:** https://github.com/andy-graybeal/Cybersecurity-Playbook

**Repository Access:** My repository is public and viewable by anyone. I am its only collaborator.

**Private working notes:** I keep my working notes in Obsidian, synchronized to a private GitHub repository separate from my public cybersecurity playbook.

**Public artifacts:** I will publish only my original, sanitized investigation overview, evidence-selection method, reusable procedure, limitations, and AI disclosure. I will exclude Cisco handouts, sorting cards, answer keys, quiz responses, credentials, private account details, and raw restricted evidence.

**Organization:** I will add a SOC Analyst Casebook section alongside my existing certification study material. Within it, **Organizational Security** will be the primary location for the plan/casebook overview. I will cross-link completed log analysis under **System Security** and protocol analysis under **Connection Security**. Each public artifact will include **overview; what you did; evidence; AI use and verification; learning; professional connection**. I will distinguish planned work from completed findings and add learning as evidence becomes available. [1–2]

## 5. Success Checks

| Observable check                      | Pass condition                                                                                                                                            |
| ------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Traceable conclusions                 | Every factual conclusion identifies evidence ID, source, and specific supporting record/field.                                                            |
| Time context preserved                | Every used timestamp retains its original time zone, or explicitly states that the zone is unknown; conversions are labeled.                              |
| Presence distinguished from execution | The casebook claims neither execution from a file match alone nor local compromise from a public reputation label.                                        |
| Repeatable procedure                  | Another analyst can follow the documented source, indicator, filters, and time window with the same supplied evidence; untested repeatability is labeled. |
| AI and privacy review                 | The retained AI record includes two actual source checks and an analyst decision; public material passes a check for restricted or identifying content.   |

### Sources and AI Disclosure

**[1]** Instructor, *Milestone 1 — Investigation Scope and Evidence Plan*, supplied Blackboard instructions. **[2]** Instructor, *Week 3 Overview* and *Data Sources, Threat Intelligence, and Lab Plans*, supplied Week 3 documents. **[3]** My *Graybeal_W3_ThreatIntelligence*, October 30, 2026, Sections 1 and 4: H1–H3 research and actual AI verification record.

- Training activities: https://www.netacad.com/launch?id=7d95e605-84b7-4e77-b394-eba60ddada08&tab=curriculum&view=12d2ab6a-4fa0-4adc-93e7-ca73d8fee3a1 (login required).
- CyberChef: https://gchq.github.io/CyberChef/
- H3 report: https://www.virustotal.com/gui/file/89e0d97c3f6b79962f97e02152cff003f17d940f973d762874576dab2bc3a312/detection (access recorded October 30, 2026 in my 2.2 record).

**AI assistance:** ChatGPT drafted and organized this plan using the supplied instructions and my 2.2 record. The repository and private-notes descriptions reflect my own setup. Local evidence has not yet been supplied, and the proposed investigation checks have not been performed.
