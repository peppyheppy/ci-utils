require 'spec_helper'

describe 'Health Check BIN' do

  it "should display error message when url is missing" do
    run_local_command "ci-health-check" do |result,stdout,stderr|
      result.should == 1
      stderr.should =~ /URL parameter is missing/
    end
  end

  it "should not display error message when url is present" do
    run_local_command "ci-health-check http://www.google.com/" do |result,stdout,stderr|
      result.should == 0
      stderr.should_not include('rror')
    end
  end

  describe "DO IT LIVE on staging" do
    # for both http and https
    ['s', ''].each do |s|
      before :each do
        # MAJOR ASSUMPTION: this url should alsways ahve basic auth
        # can't stub a command line tool's requests: stub_http_request(:get, /.**/).to_return(:status => [401, "Not Authorized"])
        @live_staging_url = "http#{s}://www.google.com/health"
      end

      it "should display unauthorized error if result is 401" do
        run_local_command "ci-health-check #{@live_staging_url}" do |result,stdout,stderr|
          result.should == 1
          stderr.should =~ /Unauthorized/
        end
      end

      it "should display be authorized if valid basic auth is sent over" do
        # NOTE: should not hardcode pa55w0rd5 in tests like this!
        run_local_command "ci-health-check #{@live_staging_url} --auth admin:yoyo" do |result,stdout,stderr|
          result.should == 0
          stdout.should =~ /OK/
        end
      end
    end
  end
end
