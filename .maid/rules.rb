# If you come up with some cool tools of your own, please send me a pull request on GitHub!  Also, please consider sharing your rules with others via [the wiki](https://github.com/benjaminoakes/maid/wiki).
#
# For more help on Maid:
#
# * Run `maid help`
# * Read the README, tutorial, and documentation at https://github.com/benjaminoakes/maid#maid
# * Ask me a question over email (hello@benjaminoakes.com) or Twitter (@benjaminoakes)
# * Check out how others are using Maid in [the Maid wiki](https://github.com/benjaminoakes/maid/wiki)

Maid.rules do
  rule 'trash tmp files' do
    dir('~/tmp/*').each do |path|
      trash(path) if 1.week.since?(modified_at(path))
    end
  end

  rule 'Ansible tmp files' do
    dir('~/*.retry').each do |path|
      trash(path)
    end
  end

  rule 'Old files downloaded' do
    dir('~/Downloads/[!Archive/]*').each do |path|
      if 1.week.since?(accessed_at(path))
        move(path, '~/Downloads/Archive/')
      end
    end
  end
end
