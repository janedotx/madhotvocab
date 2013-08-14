class BundleProgress < ActiveRecord::Base
  belongs_to :user
  # attr_accessible :title, :body

  def reset_words_seen(bundle_id)
    ws = Word.find_all_by_bundle_id(bundle_id)
    self.words_not_yet_seen = Marshal.dump(ws.map { |w| w.id }.shuffle)
    self.words_seen = Marshal.dump([])
    self.save
  end

  def unpacked_words_seen
    @unpacked_words_seen ||= Marshal.load(self.words_seen)
  end

  def unpacked_words_not_yet_seen
    @unpacked_words_not_yet_seen ||= Marshal.load(self.words_not_yet_seen)
  end

  def preview_next_word
    unpacked_words_not_yet_seen[0]
  end

  def return_next_word
    word = unpacked_words_not_yet_seen.shift
    Marshal.dump(unpacked_words_seen)
    unpacked_words_seen << word
    Marshal.dump(unpacked_words_seen)
    self.save
    word
  end
end
