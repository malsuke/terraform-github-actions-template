data "tls_certificate" "github_actions" {
  url = "https://token.actions.githubusercontent.com/.well-known/openid-configuration"
}

resource "aws_iam_openid_connect_provider" "github_oidc_provider" {
  url            = "https://token.actions.githubusercontent.com"
  client_id_list = ["sts.amazonaws.com"]
  // thumbprint_listについて : https://qiita.com/minamijoyo/items/eac99e4b1ca0926c4310
  thumbprint_list = [data.tls_certificate.github_actions.certificates[0].sha1_fingerprint]
}
