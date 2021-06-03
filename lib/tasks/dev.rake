namespace :dev do
  desc "Configura o Ambinete de desenvolvimento"
  task setup: :environment do   
    puts "Cadastrando kind contato"
    
    kinds = %w(Friend Known Commercial)
    kinds.each do |kind|
      Kind.create!(description: kind)
    end

    puts "Kinds cadastrado com sucesso"

    puts "Cadastrando contatos"
    
    100.times do |i|
      puts "#{i} - 100"
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.days.ago, to: 18.years.ago), 
        kind: Kind.all.sample
      )
    end
    puts "Contatos cadastrados com sucesso"

  end
end