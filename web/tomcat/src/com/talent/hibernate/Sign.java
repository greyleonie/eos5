package com.talent.hibernate;

public class Sign  implements java.io.Serializable {
   private Integer SignID;
   private Integer SpecialID;
   private String name;
   private String sex;
   private String Education;
   private String Organ;
   private String Department;
   private String Post;
   private String PostLevel;
  public String getName() {
    return name;
  }

  public String getDepartment() {
    return Department;
  }

  public Integer getSpecialID() {
    return SpecialID;
  }

  public String getPost() {
    return Post;
  }

  public String getPostLevel() {
    return PostLevel;
  }

  public Integer getSignID() {
    return SignID;
  }

  public String getEducation() {
    return Education;
  }

  public String getOrgan() {
    return Organ;
  }

  public void setSex(String sex) {
    this.sex = sex;
  }

  public void setName(String name) {
    this.name = name;
  }

  public void setDepartment(String Department) {
    this.Department = Department;
  }

  public void setSpecialID(Integer SpecialID) {
    this.SpecialID = SpecialID;
  }

  public void setPost(String Post) {
    this.Post = Post;
  }

  public void setPostLevel(String PostLevel) {
    this.PostLevel = PostLevel;
  }

  public void setSignID(Integer SignID) {
    this.SignID = SignID;
  }

  public void setEducation(String Education) {
    this.Education = Education;
  }

  public void setOrgan(String Organ) {
    this.Organ = Organ;
  }

  public String getSex() {
    return sex;
  }

}
