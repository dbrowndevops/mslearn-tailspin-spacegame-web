provider "pagerduty" {
    token = "3QWzaAPCffpz_C-41Cz_"
}
resource "pagerduty_escalation_policy" "Terraform_Policy" {
    name = "Terraform Engineering Escalation Policy"
    num_loops = 2

    teams = [TerraformPagerDutyTeam.id]

    rule {
        escalation_delay_in_minutes = 10
        target {
            type = "user"
            id = pagerduty_user.David_Brown.id
        }
    }
}