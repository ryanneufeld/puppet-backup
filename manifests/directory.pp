define backup::directory() {
  file_line { "$name":
    path => "/home/backup/manifest",
    line => "$name",
    ensure => "$ensure",
  }
}
