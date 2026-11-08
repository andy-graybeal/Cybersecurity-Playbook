### Data-to-Decision Playbook

**Course:** CYBR-2102 — Cisco CCNA Security  
**Semester:** Autumn 2026  
**Knowledge Area:** System Security  
**Crosscutting Concepts:** Confidentiality, Integrity, Risk, Adversarial Thinking, Systems Thinking, Responsible AI  
**Skills Demonstrated:** Security source selection, SPL filtering and aggregation, field inspection, time-scope verification, evidence interpretation, corroboration, and analyst documentation.

#### Overview

This playbook helps a beginning SOC analyst or IT technician choose security records and interpret a search without claiming more than the evidence supports. It turns my Week 3 source-selection and Week 4 search-interpretation work into a repeatable procedure.

**Intended reader:** A beginning SOC analyst or IT technician preparing an investigation note or handoff.

**Analyst question:** What do the available records show about the activity in a defined time window, what could the search be missing, and what evidence is needed before escalation?

#### What I Did

I used my completed Week 3 and Week 4 assignments to develop this procedure. I also installed Splunk Enterprise in an Ubuntu VM, uploaded the four-row fictional CSV dataset provided in the Blackboard assignment, and installed the BOTS v3 dataset used in the Cisco Networking Academy assignment. I executed failure-count searches and adapted a Windows Application event search from the NetAcad assignment to match the sourcetype values in my own Splunk installation. I interpreted the guided views in NetAcad and separately executed searches in my own Splunk instance.

##### Security Data Sources and Their Limitations

| Category       | Example source                                           | Useful information                                                                              | One limitation                                                                                         |
| -------------- | -------------------------------------------------------- | ----------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| Authentication | Linux `auth.log` containing SSH authentication records   | Username, timestamp, source address when recorded, and accepted password/public-key messages    | Accepted credentials do not prove the account owner was the person connecting.                         |
| Endpoint       | Symantec AntiVirus events in the Windows Application log | Host, detection time, threat name, file path, and reported remediation action                   | Detection or deletion does not establish whether the file executed or whether the host is fully clean. |
| Network        | pfSense firewall logs                                    | Time, addresses, ports, protocol, and logged pass/block actions                                 | Records depend on logging settings; a block alone does not prove malicious intent.                     |
| Cloud          | AWS S3 access logs                                       | Requests, requester information, source address, requested objects, and outcomes where recorded | Access activity alone does not establish who approved a permission change.                             |

##### Ordered procedure

1. **Define the question and time scope.** State what you want to find out and the period you will search, including the timezone.
2. **Choose relevant data.** Select logs that can answer the question.
3. **Inspect actual fields and events.** Check actual events for the field names and values you need.
4. **Explain filters and transformations.** Explain which events your search filters select, then explain how the transformations summarize or display those events.
5. **Record observations and uncertainty.** State what the results show and what they do not establish.
6. **Identify corroboration or escalation.** Identify evidence that could resolve an uncertainty, or explain when escalation is appropriate.

#### Evidence

##### Original illustrative example — invented training data

The following five records are an original example created for this artifact. They are not Cisco NetAcad scenario results or the four-row Blackboard course exercise. Account labels are fictional and the IP address is from a documentation range. All times are UTC on November 8, 2026.

| Row | Time     | user      | action  | src_ip        |
| --- | -------- | --------- | ------- | ------------- |
| 1   | 15:00:00 | example-a | failure | 198.51.100.25 |
| 2   | 15:01:00 | example-b | failure | 198.51.100.25 |
| 3   | 15:02:00 | example-a | success | 198.51.100.25 |
| 4   | 15:03:00 | example-b | success | 198.51.100.25 |
| 5   | 15:04:00 | example-c | failure | 198.51.100.25 |

**Fixed scope:** 15:00:00 inclusive to 15:05:00 exclusive, UTC.

| Filter within that scope            | Manual expected selection                                        | Interpretation limit                                                                                                          |
| ----------------------------------- | ---------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| `user="example-a" action="failure"` | Row 1: one failure                                               | Excludes the later success and all other accounts. It cannot establish that no successful or related activity occurred.       |
| `src_ip="198.51.100.25"`            | Rows 1–5: three failures and two successes across three accounts | Reveals context hidden by the narrow filter. A shared address still does not establish a common actor or unauthorized access. |

**Execution status: NOT EXECUTED — manual fixture check only.** These selections were checked against the table. A real implementation also needs a verified data scope and correctly parsed timestamps. The proposed next check is device/session and network context to evaluate whether the shared address represents an approved shared connection.

##### Connection to the Week 4 query-review work

My private Activity 4.2 appendix contains the full AI interaction and execution record for a separate, instructor-supplied four-row CSV. Its sanitized verification disclosure is below. Completion screenshots, assessment answers, and full prompt/response records remain in the private coursework rather than this public artifact.

#### AI Use & Verification

**Tool/date:** ChatGPT, November 7–8, 2026. Query assistance began November 7; this artifact was prepared November 8.

**Purpose:** Help apply a grouping command to my failure-event search, troubleshoot field filters, explain results, and organize the written record. `stats count by user` was already present in the course guide; ChatGPT helped me apply it rather than originating that command. Splunk's built-in autocomplete assisted with field values; I did not use Splunk AI Assistant.

| Check                   | Evidence and method                                                                                                                                                                           | Result                                                                                                                                                                                                      |
| ----------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Syntax and field check  | Splunk's built-in autocomplete suggested available source, sourcetype, host, and action values. I executed the completed search in my local Splunk instance.                                  | The initial BOTS v3 search returned no results. After inspecting the data, I changed the sourcetype filter to `wineventlog:application`. The revised search returned the relevant Application events.       |
| Dataset and scope check | I compared the four fictional rows with individual-user searches and the grouped search. I corrected the initial All time selection to November 2, 2026, 14:00–14:05 UTC and reran the query. | Three failure rows were included and the success row was excluded: trainee-a = 2, trainee-b = 1. The restricted-window results matched the earlier counts because all four events fell within the interval. |

**Corrections and retained logic:** I removed the individual-user restriction when grouping both users and retained the failure filter. I corrected the time scope from All time to the required interval. I also learned to verify a supplied sourcetype against the values present in my local data before using it.

**Execution status:** The four-row course-exercise query was **EXECUTED** in my local Splunk Enterprise instance. The new five-row public example above was **NOT EXECUTED**. One does not establish execution of the other.

**Final analyst judgment:** The course-exercise search produced counts consistent with the fictional records and the requested time window. This supports the filter/grouping logic for that small fixture; it is not a verified real-world detection or evidence of malicious activity. I retain responsibility for the final interpretation. The full work record is in the private Activity 4.2 submission.

#### What I Learned

I learned how to install Splunk, import data, run basic filtered SPL searches, and count events using `stats`. I was surprised that Splunk displayed 21 fields from just four rows of data, including extracted fields and metadata. Its built-in autocomplete helped me construct searches and correct syntax as I worked. I haven’t installed Splunk AI Assistant, but I’m interested in trying it.

I had to use a more specific sourcetype than the one given in the Cisco NetAcad example to get the same information. I haven’t confirmed why the sourcetype differed; it may relate to the dataset version or my installation’s configuration.


##### Revision after review

No instructor feedback had been received when this artifact was prepared. During review with ChatGPT and my own execution checks, I corrected the description of the endpoint summary from counting events to displaying distinct messages. This artifact now explicitly distinguishes `count` from `values(Message)`. I also carried forward the verified time-scope correction from the CSV exercise. These are documented review-based changes, not claimed instructor feedback.

#### Cybersecurity Connection

Authentication, endpoint, firewall, and cloud records provide different views of activity. Correlating them can help distinguish accepted credentials from a known human identity, a detected file from confirmed execution, and a configuration change from an approved change. Keeping those distinctions visible supports accurate escalation and avoids unsupported claims of compromise.

#### Professional Connection

SOC analysts, incident responders, and IT administrators need notes that another person can reproduce and assess. Recording the data source, time range, filters, summary behavior, uncertainty, and proposed next check makes a handoff useful. This method also makes AI-assisted work reviewable: the analyst checks the proposal and owns the decision.

##### References

1. Cisco Networking Academy, *Data and Tools for Defense Analysts*, lessons 1.5, 3.4–3.5, and activities 4.1–4.3. Source selection, search transformations, scope, and evidence interpretation. [Assigned course](https://www.netacad.com/launch?id=7d95e605-84b7-4e77-b394-eba60ddada08&tab=curriculum&view=12d2ab6a-4fa0-4adc-93e7-ca73d8fee3a1).
2. Splunk, [stats command reference](https://help.splunk.com/en/splunk-enterprise/search/spl-search-reference/9.3/search-commands/stats). Aggregation and grouping.
3. Splunk, [Multivalue stats and chart functions](https://help.splunk.com/en/splunk-enterprise/spl-search-reference/9.1/statistical-and-charting-functions/multivalue-stats-and-chart-functions). `values()` returns distinct field values.
4. Netgate, [Viewing the Firewall Log](https://docs.netgate.com/pfsense/en/latest/monitoring/logs/firewall.html). Logging settings and record retention.
5. Splunk, [BOTS v3 dataset](https://github.com/splunk/botsv3). Dataset used for my additional local search practice; no vendor answer key or incident-result screenshot is reproduced here.



**AI disclosure:** ChatGPT drafted most of this document using my completed assignments and our discussions. It helped organize the content, develop the illustrative example, explain SPL, troubleshoot searches, and draft the interpretations and reflections. I reviewed and revised the wording and checked the search results in my own Splunk instance. I am responsible for the final content.
