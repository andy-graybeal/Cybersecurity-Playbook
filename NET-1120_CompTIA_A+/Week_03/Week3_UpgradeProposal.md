Assignment:

> Purpose: Build your technical planning skills by evaluating upgrade options for a workstation and documenting required UEFI/BIOS settings.
>
> Instructions:
>
>    In your Private Playbook repository, create a new Markdown file named:
>    Week3_UpgradeProposal.md
>    Include the following sections:
>
>    CPU Upgrade: Identify a compatible CPU upgrade for a sample desktop. Note socket type and performance improvements.
>    RAM Upgrade: Specify supported RAM type, speed, and max capacity for the system.
>    Storage Upgrade: Recommend SSD/HDD upgrade with interface type (SATA, NVMe).
>    UEFI Checklist: Provide at least 5 steps/settings you would configure in UEFI (e.g., boot order, TPM, Secure Boot).
>
>    Keep explanations concise but professional (bullet points acceptable).
>    Commit and push to your Playbook repository.
>
> Submission: No direct Blackboard upload. Mark as Complete in Blackboard once committed.
>
> Grading: Counts toward Portfolio (40%). Graded Complete/Incomplete.
   
   
I've chosen to assume I have a 10 year old machine.  I like Lenovo workstations, so I looked up popular Lenovo Thinkstation released 10 years ago.  The google results were a Thinkstation P series.  Within the series had a huge difference of computing power, I chose the most minimal workstation, the P300.

* CPU Upgrade: Intel Xeon E3-1281 v3, E3-1276 v3, or an Intel Core i7-4790; all go into a LGA1150 socket- If it previously had a i3 or i5, this is a significant upgrade!  I've always wanted a Xeon processor so lets go with the Xeon E3-1281 as we haven't mention that money in an issue.
* RAM Upgrade: 32MB max spread over 4 slots.  8GB per slot @ 1600mHz -- UDIMM DDR3-1600, in matched pairs.
* Storage Upgrade: SSD w/ SATA
* EUFI Settings:
    - Enable "Intel Virtualization Technology"
    - Enable "VT-d" for direct access to hardware from virtualized environments
    - Enable "TxT" - "Trusted Execution Technology" Which uses a TPM
    - Enable "Secure Boot"
    - From the boot order, Exclude the FDD and the NIC
