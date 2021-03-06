variable "custom_policy_enabled" {
  description = "custom policy definition enabled if value is false set exist_policy variable"
  type        = bool
  default     = false
}

variable "exist_policy" {
  description = "The display name of the exiting policy definition."
  type        = string
  default     = ""
}

variable "policy_name" {
  description = "The name of the policy definition. Defaults generated from display name"
  type        = string
  default     = ""
}

variable "policy_display_name" {
  description = "The display name of the policy definition."
  type        = string
  default     = ""
}

variable "policy_description" {
  description = "The description of the policy definition."
  type        = string
  default     = ""
}

variable "policy_rule_content" {
  description = "The policy rule for the policy definition. This is a json object representing the rule that contains an if and a then block."
  type        = string
  default     = ""
}

variable "policy_parameters_content" {
  description = "Parameters for the policy definition. This field is a json object that allows you to parameterize your policy definition."
  type        = string
  default     = ""
}

variable "policy_mode" {
  description = "The policy mode that allows you to specify which resource types will be evaluated. The value can be `All`, `Indexed` or `NotSpecified`."
  type        = string
  default     = "All"
}

variable "policy_assignments" {
  description = "Map with maps to configure assignments. Map key is the name of the assignment."
  type = map(object({
    name            = string,
    parameters      = string,
    location        = string,
  }))
}

variable "policy_mgmt_group_name" {
  description = "Create the Policy Definition at the Management Group level"
  type        = string
  default     = null
}
