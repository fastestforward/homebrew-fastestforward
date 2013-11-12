require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Libmaxminddb < Formula
  homepage ''
  head 'https://github.com/maxmind/libmaxminddb.git', :revision => "ce3dc71f04a7b7de6780581bf6ded66ab972e405"
  version '159b18652fb265025e1617266692f8e5a39cccf6'
  # sha1 '554081cd06315a48731d9b503869ebb9a514f75d'

  depends_on 'automake' => :build
  depends_on 'libtool' => :build

  def install
    # ENV.j1  # if your formula's build system can't parallelize

    # Remove unrecognized options if warned by configure
    system "./bootstrap"
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    # system "cmake", ".", *std_cmake_args
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test libmaxminddb`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "--version"`.
    system "make", "check"
  end
end
