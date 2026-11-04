# README merge and issue report

Reviewed on **November 4, 2026** against the supplied working copy of `Virtuoso-4bit-Async-Counter`.

## Documentation repairs

- Merged the design walkthrough, layout results, setup instructions, analysis, troubleshooting and follow-up work from both drafts into `README.md`. `README_1.md` now points to the consolidated README.
- Corrected waveform links from the removed `output/` folder to `results/`.
- Regenerated all **16 waveform PNG previews from the 12 current result PDFs**, preserving the existing preview names and retaining links to the PDFs.
- Corrected `nand` / `nand_sim` references to `nand2` / `nand2_sim`, replaced the placeholder clone address with the configured repository URL, and updated the folder guide.
- Incorporated all **20 supplied troubleshooting/setup screenshots**, distinguishing observed errors, proposed checks and saved success evidence. Chat text visible in images was treated as context, not as instructions or proof of a fix.
- Corrected the counter description to match the shared-clock synchronous topology in the supplied schematic. Preserved the historical repository, cell and result filenames.
- Replaced the unsupported overshoot-growth table with selected annotated output voltages and marker IDs from the current PDFs. Removed claims of guaranteed measurement accuracy, proven global extrema and complete functional equivalence.
- Distinguished a DRC pass and LVS MATCH from environment diagnostics, ERC coverage and extraction warnings. Qualified HVT/SVT and process-node claims.

## Issues that still need attention

### 1. Counter name and topology disagree

**Evidence:** `schematic/4-Bit_Synchronous_Counter.png` shows a common clock to four T flip-flops and combinational toggle enables. The repository and `Kamalin/Asynchronous_4bit_counter` cell use asynchronous names.

**Impact:** A ripple-counter explanation is incorrect for the supplied schematic. Output frequency division alone does not establish a ripple topology.

**Next step:** Confirm the intended design and the current OpenAccess top-cell connections in Virtuoso before renaming cells or deciding whether the circuit itself should change. The documentation now describes the shown topology accurately.

### 2. Device variants differ between artifacts

**Evidence:** `schematic/NAND.png` labels devices `n1hvt` / `p1hvt`; `Kamalin/lvs_runs/sch.sp` lines 5–8 use `N1SVT` / `P1SVT`, with L = 18 nm. The QRC device counts also identify SVT devices. Logs identify Generic Finfet Multi Pattern PDK v0.5, not a verified foundry process node.

**Impact:** The screenshots and verification exports cannot be assumed to describe the same device-variant configuration. HVT/LVT comparison conclusions are not supported.

**Next step:** Archive the exact schematic, model corner and selected views for each run, and regenerate screenshots/results from a consistent configuration.

### 3. Earlier waveform conclusions conflict with the saved PDFs

**Evidence:** In `results/NAND.pdf`, marker M28 on `/vout` is 1.05695 V; in `results/NAND(AV).pdf`, M5 is 974.098 mV. At VDD = 800 mV, these samples are 256.95 mV and 174.098 mV above VDD. The earlier draft presented the opposite direction. Similar reversals occur at higher levels, and some of its quoted values do not match the selected markers.

The counter's Q3 falling transition occurs near 5 ns in the plain-filename export and near 1 ns in the AV export. Different startup states are one possible explanation; the exports alone do not settle the cause. Their shared top-cell `schematic` header does not identify the NAND view selected within the hierarchy.

**Impact:** Neither “extraction doubles the spikes” nor identical full count sequences can be established from these artifacts. Selected markers are not verified global extrema. The DC pages hold B low while sweeping A, so they do not establish full switching-transfer/noise-margin behavior.

**Next step:** Keep the current filenames until the source runs are identified. Save raw waveforms and generated netlists, match initialization and simulation conditions, then measure peaks and propagation delays reproducibly. Document what differs in the `NAND_CAP` testbench.

### 4. Simulation reproduction is incomplete

**Evidence:** `CDS.log` references `/root/rcx_models.scs` at lines 15342 and 16267, and earlier runs reference `/root/qrc_parasitic_models.scs`. These files, portable ADE states, raw waveforms and the licensed PDK are not included. Saved scripts use original-machine paths such as `/root/Kamalin` and `/home/install/PVS222`.

**Impact:** A reader cannot reproduce the runs from this repository alone. Guessing a replacement parasitic-model file could change the simulation.

**Next step:** Supply the required user-authored model definitions or documented setup instructions, record the model/view configuration and build fresh run settings for the local installation. Obtain the PDK and licenses separately through the appropriate source.

### 5. Extraction completed with unresolved diagnostics

**Evidence:** `Kamalin/lvs_runs/svdb/qrc.nand2.log` records 90 capacitor and 91 resistor instances at lines 1806–1811, but also contains:

- PDK initialization / `vfoAdvGuardRing` errors at lines 63–67 and 1641–1645.
- A missing `.props` warning at line 236.
- Internal net-reference warnings at lines 1775–1793.
- **28 floating nets** at lines 1829 and 1850.

The DRC success screenshot reports 1 error / 63 warnings, and the LVS success screenshot 2 errors / 70 warnings, despite their passing geometry/comparison results. Visible messages include shell function import and stream layer-map diagnostics.

**Impact:** The reports establish historical DRC/LVS results and extraction completion, but do not prove every diagnostic harmless or the current views fully verified.

**Next step:** Review the floating nets and environment/export messages in the matching Cadence/PDK installation, then rerun the relevant checks. Do not suppress them solely because extraction completed.

### 6. The “LVS summary” does not demonstrate ERC coverage

**Evidence:** `verification/NAND_LVS_summary.sum` is a copy of `Kamalin/lvs_runs/nand2.sum`, a **PVS HERC** summary. It says `erc2 Not Executed!` at line 161 and records zero ERC rule checks at line 169. Actual LVS MATCH is in `Kamalin/lvs_runs/nand2.rep.cls`, line 12; zero parameter mismatches are recorded at line 53.

**Impact:** “ERC Empty” and this filename cannot support a claim of a completed clean ERC sweep.

**Next step:** Keep LVS comparison and ERC results separate. Configure and document the intended ERC checks if electrical-rule coverage is required. The README now links the comparison report for MATCH.

### 7. Physical verification covers only the NAND

**Evidence:** Only `Kamalin/nand2` contains `layout` and `av_extracted` views. The archived DRC/LVS reports target `nand2` and date to June 22, 2026.

**Impact:** Higher-level AV runs can include NAND-internal parasitics, but not extracted interconnect for a complete latch, flip-flop or counter layout. No full-counter physical verification is supplied.

**Next step:** Treat this as the documented project scope. Higher-level layout, extraction and verification are additional work if full-counter post-layout results are intended.

### 8. Some editor problems have no confirmed resolution

**Evidence:** `assets/Screenshots/Outline_not_moving.png` shows Stretch active without identifying the object's type. `Pin_out_of_Die_Area.png` shows a displaced ground pin, not an explicit die-area rule error. LiAct screenshots show violations and later reports show a pass, but the intervening geometry edits are not recorded.

**Impact:** An exact fix for these events cannot be reconstructed from the screenshots alone.

**Next step:** Check the selected object, selection filters and pin-to-conductor alignment in Virtuoso. Apply the installed PDK rules to marked shapes, then rerun checks. README suggestions are labeled as checks, not as verified historical fixes.

## Validation and limits

- Reviewed both README drafts, all 20 setup/troubleshooting screenshots, the key circuit screenshots, all 16 pages of the result PDFs, and the saved DRC/LVS/QRC reports and relevant session-log entries.
- Verified the selected voltage annotations visually against their source pages.
- Checked relative file/image links, heading anchors, HTML tag balance, and image availability in the merged documentation.
- Preserved existing user changes and all circuit views, PDFs, screenshots and logs. Only documentation and regenerated README previews were changed.
- Did not run Cadence, edit circuit connectivity, change PDK/model files, commit, or push. The passing DRC/LVS results remain historical evidence rather than new verification.
