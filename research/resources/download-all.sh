#!/bin/bash
# =============================================================================
# TPA SLA Research - Native Document Downloader
# Run this from the repo root: ./research/resources/download-all.sh
# Requires: curl (comes with macOS/Linux)
# =============================================================================

set -e

RESOURCES_DIR="$(cd "$(dirname "$0")" && pwd)"
echo "Downloading TPA source documents to: $RESOURCES_DIR"
echo "============================================="

download() {
    local dir="$1"
    local filename="$2"
    local url="$3"

    mkdir -p "$RESOURCES_DIR/$dir"
    local filepath="$RESOURCES_DIR/$dir/$filename"

    if [ -f "$filepath" ]; then
        echo "  [SKIP] $dir/$filename (already exists)"
        return 0
    fi

    echo "  [GET]  $dir/$filename"
    if curl -sL --fail --max-time 30 "$url" -o "$filepath" 2>/dev/null; then
        local size=$(wc -c < "$filepath" | tr -d ' ')
        if [ "$size" -lt 1000 ]; then
            echo "  [WARN] $dir/$filename is only ${size}B (may be a redirect/error page)"
        else
            echo "  [OK]   $dir/$filename ($(echo "scale=0; $size/1024" | bc)KB)"
        fi
    else
        echo "  [FAIL] $dir/$filename - could not download"
        rm -f "$filepath"
    fi
}

# =============================================================================
echo ""
echo "--- CONTRACTOR CONNECTION (Crawford & Company) ---"
# =============================================================================
download "contractor-connection" \
    "CCC-Service-Sheet.pdf" \
    "https://assets.crawco.com/docs/CCC-SS-Generic.pdf"

download "contractor-connection" \
    "Managed-Repair-Advantage-Brochure.pdf" \
    "https://assets.crawco.com/docs/us-contractorconnection-managed-repair-advantage-brochure.pdf"

download "contractor-connection" \
    "CCC-FAQ.pdf" \
    "https://cdn.bfldr.com/RY9Y61B5/at/482h48r96skbt9ft586zh3qh/ccc-us-website-faq.pdf"

download "contractor-connection" \
    "Canada-Decontamination-Service.pdf" \
    "https://assets.crawco.com/docs/Canada-resource-Contractor-Connection-Announces-Decontamination-Service.pdf"

download "contractor-connection" \
    "US-Decontamination-Service-Expansion.pdf" \
    "https://assets.crawco.com/docs/US-resource-Crawford-Contractor-Connection-expands-Decontamination-Service.pdf"

download "contractor-connection" \
    "UK-Launch-Press-Release.pdf" \
    "https://assets.crawfordandcompany.com/media/2466419/crawco-pressrelease-uk-contractor-connection-final-10-17-18.pdf"

download "contractor-connection" \
    "Canada-Insurance-Requirements.pdf" \
    "https://apps.contractorconnection.com/contrdocs/canada_insurance.pdf"

# =============================================================================
echo ""
echo "--- CITIZENS PROPERTY INSURANCE (Florida) ---"
# =============================================================================
download "citizens-florida" \
    "Citizens-Managed-Repair-Brochure.pdf" \
    "https://www.citizensfla.com/documents/20702/7979944/Managed+Repair+Program+Brochure.pdf"

download "citizens-florida" \
    "Citizens-Contractor-Agreement-Full.pdf" \
    "https://www.propertyinsurancecoveragelaw.com/wp-content/uploads/2022/05/Citizens-Agreement-for-Contractor-Managed-Repair-Program-1.pdf"

download "citizens-florida" \
    "Citizens-Contractor-Agreement-Redacted.pdf" \
    "https://www.propertyinsurancecoveragelaw.com/wp-content/uploads/2021/12/Redacted-contract-Citizens-Agreement-for-Contractor-Managed-Repair-Program-1.pdf"

download "citizens-florida" \
    "Citizens-Market-Conduct-Exam-2025.pdf" \
    "https://floir.com/docs-sf/property-casualty-libraries/market-regulation/2025/citizens-property-insurance-corporation_final-exam-report.pdf"

# =============================================================================
echo ""
echo "--- ALACRITY SOLUTIONS ---"
# =============================================================================
download "alacrity" \
    "Alacrity-Insurance-Requirements.pdf" \
    "https://em.alacrity.net/Download/Insurance%20Requirements.pdf"

download "alacrity" \
    "Alacrity-Master-Contract.pdf" \
    "https://em.alacrity.net/Download/Master_Contract.pdf"

download "alacrity" \
    "CPG-Alacrity-Claims-Process-Brochure.pdf" \
    "https://www.cpg.org/globalassets/documents/publications/cic-understanding-the-claims-process-using-alacrity-services-brochure.pdf"

# =============================================================================
echo ""
echo "--- SEDGWICK ---"
# =============================================================================
download "sedgwick" \
    "Sedgwick-Repair-Solutions-2024.pdf" \
    "https://www.sedgwickrepair.com/wp-content/uploads/2024/11/SEDGWICK_REPAIR_SOLUTIONS.pdf"

download "sedgwick" \
    "Sedgwick-Repair-Solutions-Distinguished.pdf" \
    "https://distinguished.com/wp-content/uploads/2021/01/Sedgwick-Repair-Solutions.pdf"

download "sedgwick" \
    "VeriClaim-Press-Release.pdf" \
    "https://www.sedgwick.com/assets/uploads/documents/EdReis_Vericlaim_Repair_Solutions_PR.pdf"

download "sedgwick" \
    "VeriClaim-First-Choice-Acquisition.pdf" \
    "https://experts.sedgwick.com/assets/uploads/documents/VeriClaim-acquires-First-Choice-Repair-press-release.pdf"

# =============================================================================
echo ""
echo "--- BLUSKY RESTORATION ---"
# =============================================================================
download "blusky" \
    "BluSky-Subcontractor-Qualification-Packet.pdf" \
    "https://www.goblusky.com/wp-content/uploads/2021/04/subcontractor-qualification-packet-rev.-3-22-21v6.pdf"

download "blusky" \
    "BluSky-Trade-Partner-Instructions.pdf" \
    "https://www.goblusky.com/media/0_Instructions-How_to_complete_BluSky_Trade_Partner_Qualification_v62624.pdf"

# =============================================================================
echo ""
echo "--- MADSKY MRP ---"
# =============================================================================
download "madsky" \
    "MADSKY-MRP-vs-Other-TPAs-Executive-Summary.pdf" \
    "http://madskymrp.com/wp-content/uploads/2016/10/Executive-Summary-MRP-vs.-Other-TPAs.pdf"

# =============================================================================
echo ""
echo "--- RIA (Restoration Industry Association) ---"
# =============================================================================
download "ria" \
    "RIA-2025-TPA-Scorecard-Report.pdf" \
    "https://cdn.ymaws.com/members.restorationindustry.org/resource/resmgr/RIA_2025_TPA_Scorecard_Repor.pdf"

# =============================================================================
echo ""
echo "--- LEGAL / REGULATORY ---"
# =============================================================================
download "legal" \
    "FAPIA-vs-Velocity-Risk-Complaint-2025.pdf" \
    "https://www.insurancejournal.com/app/uploads/2025/10/FAPIA-complaint.pdf"

download "legal" \
    "Citizens-FL-OIR-Market-Conduct-Exam-2025.pdf" \
    "https://floir.com/docs-sf/property-casualty-libraries/market-regulation/2025/citizens-property-insurance-corporation_final-exam-report.pdf"

# =============================================================================
echo ""
echo "--- BELFOR ---"
# =============================================================================
# Note: BELFOR OMNIA Partners contracts are behind a portal but this page lists them
echo "  [INFO] BELFOR OMNIA Partners contracts: https://www.omniapartners.com/suppliers/belfor-usa-group-inc/public-sector/contract-documents"
echo "  [INFO] Visit the URL above and download manually (requires portal navigation)"

# =============================================================================
echo ""
echo "--- PUROCLEAN ---"
# =============================================================================
# PuroClean white paper is behind a form
echo "  [INFO] PuroClean Insurance White Paper: https://www.puroclean.com/whitepaper/how-restoration-providers-and-insurance-companies-collaborate-to-improve-property-damage-recovery/"
echo "  [INFO] Requires form submission to download"

# =============================================================================
echo ""
echo "============================================="
echo "Download complete!"
echo ""
echo "Documents that require manual download (login/form required):"
echo "  1. BELFOR OMNIA contracts  -> visit omniapartners.com link above"
echo "  2. PuroClean white paper   -> visit puroclean.com link above"
echo "  3. RIA TPA Scorecard       -> may require RIA membership"
echo "  4. Accuserve portal docs   -> visit help.sublynk.com links in RESOURCE-INDEX.md"
echo ""

# Count what we got
total=$(find "$RESOURCES_DIR" -name "*.pdf" | wc -l | tr -d ' ')
echo "Total PDFs downloaded: $total"
echo ""
