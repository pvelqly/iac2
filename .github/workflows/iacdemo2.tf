name: Qualys IAC Scan 
on: 
  schedule:
    - cron: '0 0 * * *'
jobs:
    Qualys_iac_scan:
        runs-on: ubuntu-latest
        name: Qualys IaC Scan
        steps:
          - name: Checkout
            uses: actions/checkout@v2 
            with:
                fetch-depth: 0
    
          - name: Qualys IAC scan action step
            uses: Qualys/github_action_qiac@main
            id: qiac
            env:
                URL: ${{ secrets.URL }}
                UNAME: ${{ secrets.USERNAME }}
                PASS: ${{ secrets.PASSWORD }}
          - name: Upload SARIF file
            uses: github/codeql-action/upload-sarif@v1
            if: always() 
            with:
                 sarif_file: response.sarif
