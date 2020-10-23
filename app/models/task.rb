class Task < ActiveRecord::Base
  belongs_to :client
  has_many :attachments, dependent: :destroy

  accepts_nested_attributes_for :attachments, reject_if: :all_blank

  PROYECTOS = ["Análisis Financiero","Análisis de Costos","Asesoría en Fiscalizaciones","Reclamos Tributarios","Asesoría Contable","Consultoría Tributaria", "Revisiones Tributarias", "Restructuraciones Societarias", "Talento Humano"]

end
