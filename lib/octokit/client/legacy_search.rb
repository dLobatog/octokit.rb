module Octokit
  class Client

    # Methods for the Legacy Search API
    #
    # @see http://developer.github.com/v3/search/
    module LegacySearch

      # Legacy repository search
      #
      # @see http://developer.github.com/v3/search/#search-repositories
      # @param q [String] Search keyword
      # @return [Array<Sawyer::Resource>] List of repositories found
      def legacy_search_repositories(q, options = {})
        get("legacy/repos/search/#{q}", options)['repositories']
      end

      # Legacy repository search
      #
      # @deprecated Use {#legacy_search_repositories} instead
      # @see http://developer.github.com/v3/search/#search-repositories
      # @param q [String] Search keyword
      # @return [Array<Sawyer::Resource>] List of repositories found
      def search_repositories(q, options = {})
        legacy_search_repositories(q, options)
      end
      alias :search_repos :search_repositories

      # Legacy search issues within a repository
      #
      # @param repo [String, Repository, Hash] A GitHub repository
      # @param search_term [String] The term to search for
      # @param state [String] :state (open) <tt>open</tt> or <tt>closed</tt>.
      # @return [Array<Sawyer::Resource>] A list of issues matching the search term and state
      # @example Search for 'test' in the open issues for sferik/rails_admin
      #   Octokit.search_issues("sferik/rails_admin", 'test', 'open')
      def legacy_search_issues(repo, search_term, state='open', options = {})
        get("legacy/issues/search/#{Repository.new(repo)}/#{state}/#{search_term}", options)['issues']
      end

      # Legacy search issues within a repository
      #
      # @deprecated Use {#legacy_search_issues} instead
      # @param repo [String, Repository, Hash] A GitHub repository
      # @param search_term [String] The term to search for
      # @param state [String] :state (open) <tt>open</tt> or <tt>closed</tt>.
      # @return [Array<Sawyer::Resource>] A list of issues matching the search term and state
      # @example Search for 'test' in the open issues for sferik/rails_admin
      #   Octokit.search_issues("sferik/rails_admin", 'test', 'open')
      def search_issues(repo, search_term, state = 'open', options = {})
        legacy_search_issues(repo, search_term, state, options)
      end

      # Search for user.
      #
      # @param search [String] User to search for.
      # @return [Array<Sawyer::Resource>] Array of hashes representing users.
      # @see http://developer.github.com/v3/search/#search-users
      # @example
      #   Octokit.search_users('pengwynn')
      def legacy_search_users(search, options = {})
        get("legacy/user/search/#{search}", options)['users']
      end

      # Search for user.
      #
      # @deprecated Use {#legacy_search_users} instead
      # @param search [String] User to search for.
      # @return [Array<Sawyer::Resource>] Array of hashes representing users.
      # @see http://developer.github.com/v3/search/#search-users
      # @example
      #   Octokit.search_users('pengwynn')
      def search_users(search, options = {})
        legacy_search_users(search, options)
      end
    end
  end
end