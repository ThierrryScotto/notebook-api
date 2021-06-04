namespace :dev do
  desc "Configura o Ambinete de desenvolvimento"
  task setup: :environment do   

    # command to execute
    puts "Restore database"
    %x(rails db:drop db:create db:migrate)

    # ----- KIND -----
    puts "Cadastrando kind contato"
    kinds = %w(Friend Known Commercial)
    kinds.each do |kind|
      Kind.create!(description: kind)
    end
    puts "Kinds cadastrado com sucesso"

    # ----- CONTACTS -----
    puts "Cadastrando contatos"
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.days.ago, to: 18.years.ago), 
        kind: Kind.all.sample
      )
    end
    puts "Contatos cadastrados com sucesso"
  
    # ----- PHONES -----
    puts "Cadastrando telefones"
    Contact.all.each do |contact|
      rand(5).times do |i|      
        phone = Phone.create!(number: Faker::PhoneNumber.cell_phone)
        contact.phones << phone
        contact.save
      end
    end
    puts "Telefones cadastrados com sucesso"

    # ----- ADDRESS -----
    puts "Cadastrando endereços"
    Contact.all.each do |contact| 
        Address.create!(
          street: Faker::Address.street_address,
          city: Faker::Address.city,
          contact: contact
        )
    end
    puts "Endereços cadastrados com sucesso"
  end
end