module RandomEmailCreator

  def random_email
    (0..50).map{ ('a'..'z').to_a[rand(26)] }.join + "@example.com"
  end

end
