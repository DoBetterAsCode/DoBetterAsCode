Feature: We should have an ACM certificate with appropriate validation records

  Scenario: We are creating an ACM certificate
    Given Terraform
    And a "aws_acm_certificate" of type "resource"
    Then attribute "validation_method" equals "DNS"