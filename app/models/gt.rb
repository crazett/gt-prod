class Gt < ApplicationRecord
    belongs_to :customer, optional: true
    validates :order_date, presence: true
    validates :deliver_date, presence: true
    validates :approver_name, presence: true, if: :done?
    validates :ref_num, uniqueness: true
    validate :later_than?
    attr_accessor :customer_name
    attr_accessor :worker_name
    attr_accessor :approver_name
    PRIO = [[],["Chill", 1, "#28a745"], ["Warning", 2, "#ffc107"], ["Akut", 3, "#dc3545"]]
    WIDTH_ARRAY = [["30mm", 30], ["35mm", 35], ["40mm", 40], ["45mm", 45], ["50mm", 50], ["55mm", 55], ["60mm", 60], ["65mm", 65], ["70mm", 70], ["75mm", 75], ["80mm", 80], ["85mm", 85], ["90mm", 90]]

    def later_than?
        if deliver_date && order_date
            if deliver_date < order_date
                errors.add :deliver_date, "måste vara senare än Beställningsdatum"
            end
        end
    end
end
