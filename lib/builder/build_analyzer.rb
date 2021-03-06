module Builder
  class BuildAnalyzer
    include Mandate

    initialize_with :track_slug, :tag

    def call
      cmd = %Q{echo "Build analyzer for #{track_slug} for tag##{tag}"}
      if Kernel.system(cmd)
        PublishMessage.(:analyzer_ready_to_deploy, {
          track_slug: track_slug,
          image_name: "exercism-analyzer-#{track_slug}:#{tag}"
        })
      else
        # How do we want to handle this error?
      end
    end
  end
end
