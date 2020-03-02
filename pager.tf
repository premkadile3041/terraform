provider "pagerduty" {
  token = "RpMFfTZS9qgRyGy-fAyY"
}

# Create a PagerDuty team
resource "pagerduty_team" "engineering" {
  name        = "Engineering"
  description = "All engineering"
}

# Create a PagerDuty user
resource "pagerduty_user" "prem" {
  name  = "SudeepM"
  email = "sudeep.malepati@ibexlabs.com"
  role  = "admin"
}
resource "pagerduty_escalation_policy" "pipeline" {
  name      = "Data Pipeline Escalation Policy test"
  num_loops = 5

  rule {
    escalation_delay_in_minutes = 15

    target {
      type = "user_reference"
      id   = pagerduty_user.sudeep.id
    }
  }
}

