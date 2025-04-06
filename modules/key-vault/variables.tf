variable "tags" {
  type = map(string)
  default = {
    luke  = "jedi"
    yoda  = "green"
    darth = "sith"
  }
}