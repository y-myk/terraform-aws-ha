resource "aws_iam_role" "CFE_role" {
  
  name = "CFE_role"
  assume_role_policy = file("CFE_Role.json")

  tags = {
    Name = format("%s-role-%s", var.prefix, random_id.id.hex)
    }
}

resource "aws_iam_role_policy" "CFE_policy" {
  
  name = "CFE_policy"
  role = aws_iam_role.CFE_role.id
  policy = file("CFE_Policy.json")
}

resource "aws_iam_instance_profile" "CFE_profile" {
  
  name = "CFE_profile"  
  role = aws_iam_role.CFE_role.name
}


  
