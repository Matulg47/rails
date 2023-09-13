# lib/tasks/before_assets_precompile.rake
task before_assets_precompile: :environment do
    # Ejecuta el comando que inicia el empaquetado de tus activos con Yarn
    system('yarn')
  end