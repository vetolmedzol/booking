# frozen_string_literal: true

class AddTrainIdToTickets < ActiveRecord::Migration[5.2]
  def change
    add_belongs_to :tickets, :train
  end
end
