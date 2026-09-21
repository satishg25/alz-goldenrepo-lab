# UC-085 ACR Terraform plan module

This module creates an ACR and validates that the target resource group already exists. The private endpoint and diagnostics are optional because the approved Philips subnet, Private DNS, and monitoring values are not yet supplied by the current Issue Form.

The reusable workflow performs `fmt`, `init -backend=false`, `validate`, and `plan`. It does not apply changes.
