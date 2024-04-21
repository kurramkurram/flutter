class SystemVersion implements Comparable<SystemVersion> {
  int major = 0;

  int minor = 0;

  int rev = 0;

  SystemVersion(String systemVersion) {
    final versions = systemVersion.split('.');
    major = int.parse(versions[0]);
    if (versions.isNotEmpty) minor = int.parse(versions[1]);
    if (versions.length >= 2) rev = int.parse(versions[2]);
  }

  @override
  int compareTo(SystemVersion version) {
    if (major > version.major) return 1;
    if (major < version.major) return -1;

    if (minor > version.minor) return 1;
    if (minor < version.minor) return -1;

    if (rev > version.rev) return 1;
    if (rev < version.rev) return -1;

    return 0;
  }

  bool operator <(SystemVersion version) => compareTo(version) == -1;

  bool operator >(SystemVersion version) => compareTo(version) == 1;

  bool operator <=(SystemVersion version) =>
      compareTo(version) == -1 || compareTo(version) == 0;

  bool operator >=(SystemVersion version) =>
      compareTo(version) == 1 || compareTo(version) == 0;

  @override
  bool operator ==(Object other) {
    if (other is SystemVersion) {
      return compareTo(other) == 0;
    } else {
      return false;
    }
  }

  @override
  int get hashCode => major.hashCode + minor.hashCode + rev.hashCode;
}
